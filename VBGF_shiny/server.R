# Define server logic required to draw a histogram
shinyServer(
  function(input, output) 
  {    
  GVBGF<-function(Linf,k,t0,b,d,ages)
{
  Lengths_exp<-Linf*(1-exp(-k*b*(1-d)*(ages-t0)))
  return(Lengths_exp)
}

output$VBGFplot <- renderPlot(
{
  ages<-c(1:input$amax)
  lengths.out<-GVBGF(input$Linf,input$k,input$t0,input$b,input$d,ages)
  # plot VBGF
  plot(ages, lengths.out, col = "blue",xlab="Ages",ylab="Lengths",xlim=c(0,input$amax),ylim=c(0,input$Linf*1.1),type="l",lwd=5)
}
    )
  }
)

