% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/create_cleaning_flowcharts.R
\name{create_hospit_qc_flowchart}
\alias{create_hospit_qc_flowchart}
\title{Create cleaning flowchart for hospitalisation data (TIMCI-specific)}
\usage{
create_hospit_qc_flowchart(
  n_raw_hospit_records,
  n_afterlock_pids_hospitfu_records,
  n_nonvalid_pid_records,
  n_duplicated_records,
  n_cleaned_hospit_records
)
}
\arguments{
\item{n_raw_hospit_records}{Initial number of hospitalisation records}

\item{n_afterlock_pids_hospitfu_records}{Number of records outside of lock range}

\item{n_nonvalid_pid_records}{Number of screening records with a non-valid device ID}

\item{n_duplicated_records}{Number of screening records with an entry date posterior to the lock date}

\item{n_cleaned_hospit_records}{Number of cleaned screening records}
}
\value{
This function returns a graph object
}
\description{
Create cleaning flowchart for hospitalisation data (TIMCI-specific)
}
