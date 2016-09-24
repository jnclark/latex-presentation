# LaTeX-Presentation

This repository contains a custom presentation template, utilizing the beamer document class

To use standard inline notes, proceed as per usual in Beamer. To view the presentation in pdfpc correctly, call

~~~~
pdfpc --notes=right presentation_slides.pdf
~~~~

To take advantage of pdfpc's additional notes, put the note for the slide number (as read bu pdfpc) in the following format: 
~~~~
### 7
Your comment about how to deliver a certain line
~~~~
in the file presentation_slides.pdfpc
