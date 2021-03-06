% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/businesslogic.R
\name{BusinessLogic}
\alias{BusinessLogic}
\title{Business logic of the app}
\description{
Responsible for the data wrangling, generation of text and charts and (it might be a bit of overkill in this app) filtering for the user interface. See [Using R6 as data storage](https://engineering-shiny.org/common-app-caveats.html#using-r6-as-data-storage) for more information on this solution.
}
\examples{

## ------------------------------------------------
## Method `BusinessLogic$new`
## ------------------------------------------------

business_logic <- BusinessLogic$new()

business_logic$generate_results("Endeavor Air", 1, "arr_delay", 30)

business_logic$results$title

business_logic$results$text

business_logic$results$chart
}
\section{Public fields}{
\if{html}{\out{<div class="r6-fields">}}
\describe{
\item{\code{months}}{Month numbers and their names, on the app selecting the month's name will return the month's number.}

\item{\code{metrics}}{Available metrics with better looking names for the app.}

\item{\code{data}}{Will store the data (more useful for bigger apps).}

\item{\code{unique_carriers}}{Available carriers (more useful in the case of a database with more carriers being added over time).}

\item{\code{results}}{Where results (title and text for the page and the chart itself) are stored.}
}
\if{html}{\out{</div>}}
}
\section{Methods}{
\subsection{Public methods}{
\itemize{
\item \href{#method-new}{\code{BusinessLogic$new()}}
\item \href{#method-generate_results}{\code{BusinessLogic$generate_results()}}
\item \href{#method-clone}{\code{BusinessLogic$clone()}}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-new"></a>}}
\if{latex}{\out{\hypertarget{method-new}{}}}
\subsection{Method \code{new()}}{
Create a new business logic object.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{BusinessLogic$new()}\if{html}{\out{</div>}}
}

\subsection{Returns}{
A new `BusinessLogic` object.
}
\subsection{Examples}{
\if{html}{\out{<div class="r example copy">}}
\preformatted{business_logic <- BusinessLogic$new()

business_logic$generate_results("Endeavor Air", 1, "arr_delay", 30)

business_logic$results$title

business_logic$results$text

business_logic$results$chart
}
\if{html}{\out{</div>}}

}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-generate_results"></a>}}
\if{latex}{\out{\hypertarget{method-generate_results}{}}}
\subsection{Method \code{generate_results()}}{
Generate results, all parameters come directly from the user interface of the app.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{BusinessLogic$generate_results(
  carrier_filter,
  month_filter,
  metric_filter,
  threshold
)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{carrier_filter}}{Carrier for report.}

\item{\code{month_filter}}{Month for report.}

\item{\code{metric_filter}}{Metric for report.}

\item{\code{threshold}}{Threshold for report.}
}
\if{html}{\out{</div>}}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-clone"></a>}}
\if{latex}{\out{\hypertarget{method-clone}{}}}
\subsection{Method \code{clone()}}{
The objects of this class are cloneable with this method.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{BusinessLogic$clone(deep = FALSE)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{deep}}{Whether to make a deep clone.}
}
\if{html}{\out{</div>}}
}
}
}
