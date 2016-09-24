# LaTeX-Presentation

This repository contains a custom presentation template, utilizing the beamer document class

To use standard inline notes, proceed as per usual in Beamer. To view the presentation in pdfpc correctly, call

~~~~
pdfpc --notes=right presentation.pdf
~~~~

To take advantage of pdfpc's additional notes, put the note for the slide number (as read bu pdfpc) in the following format: 
~~~~
### 7
Your comment about how to deliver a certain line
~~~~

