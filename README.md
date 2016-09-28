# LaTeX-Presentation

This repository contains a custom presentation template, utilizing the beamer document class

To use standard inline notes, proceed as per usual in Beamer. To view the presentation in pdfpc correctly, call

~~~~
pdfpc --notes=right presentation.pdf
~~~~

or 

~~~~
pdfpc --notes=right -s presentation.pdf
~~~~

to swap active displays.

If the above command does not work, try copying the file to another location, along with presentation.pdfpc, and attempting to run again.

To take advantage of pdfpc's additional notes (referenced above), put the note for the slide number (as read bu pdfpc) in the following format: 
~~~~
### 7
Your comment about how to deliver a certain line
~~~~
in the file presentation.pdfpc
