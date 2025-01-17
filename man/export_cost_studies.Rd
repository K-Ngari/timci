% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/run_rmarkdown.R
\name{export_cost_studies}
\alias{export_cost_studies}
\title{Run Rmarkdown files}
\usage{
export_cost_studies(
  cost_pid,
  cost_dir,
  research_facilities,
  report_dir,
  cost_start_date = NULL,
  cost_end_date = NULL,
  cost_lock_date = NULL,
  short = FALSE
)
}
\arguments{
\item{cost_pid}{Numeric ID of the cost and cost-effectiveness ODK Central project}

\item{cost_dir}{Path to the output folder for the cost and cost effectiveness database exports (optional)}

\item{research_facilities}{Dataframe that contains the research facilities}

\item{report_dir}{Path to the output folder for the generated Rmarkdown reports}

\item{cost_start_date}{Cost data collection start date (optional)}

\item{cost_end_date}{Cost data collection end date (optional)}

\item{cost_lock_date}{Cost data collection cleaning end date for database lock (optional)}

\item{short}{Short version of the export}
}
\description{
This function runs several Rmarkdown files to generate standardised automated reports for the Tools for Integrated Management of Childhood Illnesses (TIMCI) project.
}
