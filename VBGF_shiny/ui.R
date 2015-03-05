library(shiny)

shinyUI(fluidPage(
  
  #  Application title
  titlePanel("Generalized VBGF"),
  
  # Sidebar with sliders that demonstrate various available
  # options
  sidebarLayout(
    sidebarPanel
    (
      sliderInput("amax", "Age classes:", 
                  min=1, max=100, value=50),    
      sliderInput("Linf", withMathJax("$$L_\\infty:$$"), 
                  min=1, max=1000, value=100),
      sliderInput("k", "k:", 
                    min = 0.01, max = 1, value = 0.1,step=0.01),
      sliderInput("t0", withMathJax("$$t_0:$$"),
                  min = -5, max = 5, value = 0,step=0.1),
      
      sliderInput("b", "Wt-Lt exponent (b):", 
                 min = 2, max = 4, value = 3,step=0.01),
      
      sliderInput("d", "Allometric scaling (d):",
                  min = 0.01, max = 1, value = 0.67,step=0.01)
    ),
    
    # Plot VBGF figure and equation
    mainPanel(
      plotOutput("VBGFplot"),
      h1(strong(withMathJax(helpText('$$L_t = L_\\infty(1-e^{(-kb(1-d)(t-t_0))})^{1/{b(1-d)}}$$'))))
      )
  )
))