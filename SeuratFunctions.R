## SEurat functions###

library(Seurat)
library(cowplot)


####average expression table

AvgExTable<-AverageExpression(YOUROBJECT,slot="data",assays = "RNA")

## Violin plot ##
pdf(file="Myviolin.pdf")
plots <- VlnPlot(object = a1, features = c("Genes of Interest list"), split.by = 'group', pt.size = 0, combine = FALSE, log = TRUE,adjust=TRUE)
plots <- lapply(X = plots,FUN = function(x) x +  theme(axis.text.x = element_text(size = 16, angle = 90, hjust = .5, vjust = .5),axis.text.y = element_text(size = 10, angle = 0, hjust = 1, vjust = 0),axis.title.x = element_text(size = 1, angle = 0, hjust = .5, vjust = 0),axis.title.y = element_text(size = 16, angle = 90, hjust = .5, vjust = .5)))

CombinePlots(plots = plots, legend = 'right',nrow=1)
dev.off()


###Heatmap

DoHeatmap(
  object = immune.WT, 
  genes.use =include, 
  slim.col.label = TRUE,disp.min = -Inf,
  disp.max = Inf
)

                
#HISTOGRAM OF THE UMI, Genes and percent mitochondrial genes

g<-YOUROBJECT@metadata 

#Percent mitocondrial histo

ggplot(g, aes(x=percent.mt)) + geom_histogram( binwidth=2, fill="#69b3a2", color="#e9ecef", alpha=0.9) +
    ggtitle("Percentage Mitochondrial genes histo") 
    
# UMI count histo    
ggplot(g, aes(x=nCount_RNA)) + geom_histogram( binwidth=2, fill="#69b3a2", color="#e9ecef", alpha=0.9) +
    ggtitle("UMI count histo") 
    
# Gene count histo    
ggplot(g, aes(x=nCount_features)) + geom_histogram( binwidth=2, fill="#69b3a2", color="#e9ecef", alpha=0.9) +
    ggtitle("Total genes histo") 
 

##UMAP
UMAPPlot(a,pt.size=0.7,label.size=13,repel=TRUE,label=TRUE)
