library(ahp)
library(data.tree)
library(formattable)
library(DiagrammeR)
library(R6)

ahpFile <- system.file("extdata", "tablety.ahp", package="ahp")
carAhp <- Load(ahpFile)
Calculate(carAhp)
Analyze(
  carAhp,
  pruneFun = function(x, decisionMaker) {
    PruneLevels(x, decisionMaker, 1) && PruneByCutoff(x, decisionMaker, minWeight = 0.05)
  }
)

Analyze(carAhp)
AnalyzeTable(carAhp)

