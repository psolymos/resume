ff <- c("procpr.bbl", "letterpr.bbl", "paperpr.bbl", 
    "inbook.bbl", "subm.bbl", "report.bbl")
#dir <- "c:/Dropbox/publications/00resume/tex_cv/"
reorg_bbl <- function(file) {
    ## read bbl file
    x <- readLines(file)
    ## separate header, middle, footer, remove newlines
    sp <- c(1, which(x == ""), length(x))
    xl <- vector("list", length(sp) - 1)
    for (i in 1:length(xl)) {
        tmp <- x[sp[i]:sp[i+1]]
        tmp <- tmp[tmp != ""]
        xl[[i]] <- tmp
    }
    xlm <- xl[2:(length(xl)-1)]
    onam <- character(length(xlm))
    oyr <- integer(length(xlm))
    olab <- character(length(xlm))
    ## tweak labels
    for (i in 1:length(xlm)) {
        y <- xlm[[i]]
        ## sometimes closing bracket is not in 1st element
        ii <- min(grep("\\[", y)):min(grep("\\]", y))
        y <- c(paste(y[ii], collapse=" "), y[-ii])
        lab <- y[1]
        lab1 <- strsplit(lab, "\\[")[[1]]
        lab2 <- strsplit(lab1[2], "\\]")[[1]]
        LAB <- paste(lab1[1], "[", "<<<>>>", "] ", lab2[2], sep="")
        y[1] <- LAB
        y[2] <- paste("\\hspace{0.5pc}", y[2], sep="")
        OLAB <- lab2[2]
        OLAB <- substr(OLAB, 2, nchar(OLAB)-1)
        OLAB <- strsplit(OLAB, ":")[[1]][1]
        olab[i] <- OLAB
        OLAB <- sapply(1:nchar(OLAB), function(i) substr(OLAB, i, i))
        jj <- min(grep("[0-9]", OLAB))
        onam[i] <- paste(OLAB[1:(jj-1)], collapse="")
        oyr[i] <- as.integer(paste(OLAB[jj:(jj+3)], collapse=""))
        xlm[[i]] <- c(y, "")
    }
    ## tweak ordering
    ord <- data.frame(i=1:length(onam),name=onam, year=oyr, label=olab)
    ord <- ord[order(oyr,onam),]
    xlm <- xlm[ord$i]
    for (i in 1:length(xlm)) {
        y <- xlm[[i]][1]
        y <- gsub("<<<>>>", i, y)
        xlm[[i]][1] <- y
    }
    ## reverse ordering
    xlm <- xlm[length(xlm):1]
    ## combine with header and footer
    out <- c(xl[[1]], "", unlist(xlm), xl[[length(xl)]])
    ## write to connection
    writeLines(out, file)
    invisible(NULL)
}
#setwd(dir)
for (i in ff)
    try(reorg_bbl(i))
q(save="no")
