library("iNEXT")
library("openxlsx")

# Load Data
AssociationCounts <- read.xlsx("Statistic_tables.xlsx", 2,  colNames =  TRUE, rowNames = TRUE)
# Using the defalut function iNext to calculate related results
A2.iNEXT <- iNEXT(t(AssociationCounts)[,1], q=c(0,1,2))
B2.iNEXT <- iNEXT(t(AssociationCounts)[,2], q=c(0,1,2))
C2.iNEXT <- iNEXT(t(AssociationCounts)[,3], q=c(0,1,2))
D2.iNEXT <- iNEXT(t(AssociationCounts)[,4], q=c(0,1,2))
E2.iNEXT <- iNEXT(t(AssociationCounts)[,5], q=c(0,1,2))

# Plot the results for each association
A2.0.plot <- ggiNEXT(A2.iNEXT, grey=TRUE, facet.var="Order.q") + theme_bw() + theme(legend.position = 'none') + ylim(c(0, 35)) + ggtitle("A")
A2.1.plot <- ggiNEXT(A2.iNEXT, grey=TRUE, facet.var="Order.q") + theme_bw() + theme(legend.position = 'none') + ylim(c(0, 7))
A2.2.plot <- ggiNEXT(A2.iNEXT, grey=TRUE, facet.var="Order.q") + theme_bw() + theme(legend.position = 'none') + ylim(c(0, 5))

B2.0.plot <- ggiNEXT(B2.iNEXT, grey=TRUE, facet.var="Order.q") + theme_bw() + theme(legend.position = 'none') + ylim(c(0, 35)) + ggtitle("B")
B2.1.plot <- ggiNEXT(B2.iNEXT, grey=TRUE, facet.var="Order.q") + theme_bw() + theme(legend.position = 'none') + ylim(c(0, 7))
B2.2.plot <- ggiNEXT(B2.iNEXT, grey=TRUE, facet.var="Order.q") + theme_bw() + theme(legend.position = 'none') + ylim(c(0, 5))

C2.0.plot <- ggiNEXT(C2.iNEXT, grey=TRUE, facet.var="Order.q") + theme_bw() + theme(legend.position = 'none') + ylim(c(0, 35)) + ggtitle("C")
C2.1.plot <- ggiNEXT(C2.iNEXT, grey=TRUE, facet.var="Order.q") + theme_bw() + theme(legend.position = 'none') + ylim(c(0, 7))
C2.2.plot <- ggiNEXT(C2.iNEXT, grey=TRUE, facet.var="Order.q") + theme_bw() + theme(legend.position = 'none') + ylim(c(0, 5))
C2.plot <- ggarrange(C2.0.plot, C2.1.plot,C2.2.plot, ncol = 1, nrow = 3)

D2.0.plot <- ggiNEXT(D2.iNEXT, grey=TRUE, facet.var="Order.q") + theme_bw() + theme(legend.position = 'none') + ylim(c(0, 35)) + ggtitle("D")
D2.1.plot <- ggiNEXT(D2.iNEXT, grey=TRUE, facet.var="Order.q") + theme_bw() + theme(legend.position = 'none') + ylim(c(0, 7))
D2.2.plot <- ggiNEXT(D2.iNEXT, grey=TRUE, facet.var="Order.q") + theme_bw() + theme(legend.position = 'none') + ylim(c(0, 5))
D2.plot <- ggarrange(D2.0.plot, D2.1.plot,D2.2.plot, ncol = 1, nrow = 3)

E2.0.plot <- ggiNEXT(E2.iNEXT, grey=TRUE, facet.var="Order.q") + theme_bw() + theme(legend.position = 'none') + ylim(c(0, 35)) + ggtitle("E")
E2.1.plot <- ggiNEXT(E2.iNEXT, grey=TRUE, facet.var="Order.q") + theme_bw() + theme(legend.position = 'none') + ylim(c(0, 7))
E2.2.plot <- ggiNEXT(E2.iNEXT, grey=TRUE, facet.var="Order.q") + theme_bw() + theme(legend.position = 'none') + ylim(c(0, 5))
E2.plot <- ggarrange(E2.0.plot, E2.1.plot,E2.2.plot, ncol = 1, nrow = 3)

# The final merging task are conducted in vector drawing software Affinity Designer

