# Define server logic required to draw a histogram
shinyServer(
  function(input, output) 
  {    
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

