% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/doc_functions.R
\name{consensusRankingBoot}
\alias{consensusRankingBoot}
\title{Rank aggregation of partial rankings with optonal bootstrapping}
\usage{
consensusRankingBoot(
  x,
  bootstrap,
  nboot = 10000,
  conf.int = 0.95,
  prog.upd = TRUE
)
}
\arguments{
\item{x}{a \code{data.frame} containing columns titled \code{Reviewer}, \code{Item},
\code{Ranking}. On data structure, \code{Reviewer} and \code{Item} must be
character, and \code{Ranking} must be numeric. Each row of \code{x}
identifes the rank position that a single \code{Reviewer} awarded a single
\code{Item}}

\item{bootstrap}{a logical value indicating whether to bootstrap the rank aggregation
procedure.}

\item{nboot}{a numeric value for bootstrap replicates. Default value is \code{10000}.}

\item{conf.int}{a numeric value >0 and <1. Default value is \code{0.95}, which sets
confidence interval at 95\% level.}

\item{prog.upd}{a logical value indicating whether the user wants progress updates
on the bootstrap procedure.}
}
\value{
If \code{bootstrap} is \code{FALSE}, a \code{data.frame} is returned,
with two columns: \code{Item} and \code{Rank.est}, where \code{Item}
is a \code{Factor} containing all unique \code{Item}'s from the input
\code{data.frame} \code{x}, and where \code{Rank.est} is the estimated
(numeric) rank position based on the \code{consensusRanking()} rank
aggregation procedure.#'
\cr \cr If \code{bootstrap} is \code{TRUE}, a \code{list} is returned, with two
elements:
\itemize{
\item \code{$summaryTable} is a \code{data.frame} with six columns: \code{Item}
\code{Rank.est}, \code{Rank.cilo}, \code{Rank.cihi}, \code{Rank.median},
\code{Rank.mean}. Where \code{Item} and \code{Rank.est} are as described
above, \code{Rank.cilo} and \code{Rank.cihi} are the estimates for the
low and high confidence intervals, respectively. \code{Rank.median} and
\code{Rank.mean} both describe the average rank positions.
\item \code{$bootstrapData} is an array containing estimated (numeric)
rank positions based on the \code{consensusRanking()} rank aggregation
procedure with resampled data. \code{NA} denotes estimated rankings that
were discarded due to not containing all \code{Item}s.
}
}
\description{
This funciton calls \code{\link{RankAggregator}}::\code{\link{consensusRanking}} to
return a best consensus (or median) ranking for a set of (partial) rankings.
\cr\cr This function also provides an optional bootstrap resampling procedure to
give user-defined confidence intervals and average rank positions with
the consensus ranking.
}
\references{
Cook, W.D., Golany, B., Penn, M. and Raviv, T., 2007.
Creating a consensus ranking of proposals from reviewers
partial ordinal rankings. Computers & Operations Research,
34, pp.954-965.\cr\cr
Marshall, E.C., Sanderson, C., Spiegelhalter, D.J. and McKee,
M., 1998. Reliability of league tables of in vitro fertilisation
clinics: retrospective analysis of live birth ratesCommentary:
How robust are rankings? The implications of confidence intervals.
Bmj, 316, pp.1701-1705.
}
\seealso{
Calls the internal function \code{\link{consensusRanking}}, which calls the other
internal functions \code{\link{evaluationMatrix}}, \code{\link{consensusRanking}},
\code{\link{extendRanking}}, \code{\link{lowerBound}},
\code{\link{upperBound}}
}
