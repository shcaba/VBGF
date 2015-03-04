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
      sliderInput("Linf", "Linf:", 
                  min=1, max=1000, value=100),
      sliderInput("k", "k:", 
                    min = 0.01, max = 1, value = 0.1,step=0.01),
      sliderInput("t0", "t0",
                  min = -5, max = 5, value = 0,step=0.1),
      
      sliderInput("b", "Wt-Lt exponent (b):", 
                 min = 2, max = 4, value = 3,step=0.01),
      
      sliderInput("d", "Allometric scaling (d):",
                  min = 0.01, max = 1, value = 0.67,step=0.01)
    ),
    
    # Show a table summarizing the values entered
    mainPanel(
      plotOutput("VBGFplot"),
      #h2(strong(expression(L[t] L[inf]*(1-exp^(-k*b*(1-d)*(t-t[0]))))),align="center")
      withMathJax(helpText('and a fact about \\(\\pi\\):
           $$\\frac2\\pi = \\frac{\\sqrt2}2 \\cdot
           \\frac{\\sqrt{2+\\sqrt2}}2 \\cdot
                           \\frac{\\sqrt{2+\\sqrt{2+\\sqrt2}}}2 \\cdots$$'))
      )
  )
))