% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/serializers.R
\name{serializers}
\alias{serializers}
\alias{format_csv}
\alias{format_tsv}
\alias{format_rds}
\alias{format_geojson}
\alias{format_feather}
\alias{format_parquet}
\alias{format_yaml}
\alias{format_htmlwidget}
\alias{format_format}
\alias{format_print}
\alias{format_cat}
\alias{format_unboxed}
\alias{format_png}
\alias{format_jpeg}
\alias{format_tiff}
\alias{format_svg}
\alias{format_bmp}
\alias{format_pdf}
\title{Serializer functions provided by plumber2}
\usage{
format_csv(...)

format_tsv(...)

format_rds(version = "3", ascii = FALSE, ...)

format_geojson(...)

format_feather(...)

format_parquet(...)

format_yaml(...)

format_htmlwidget(...)

format_format(..., sep = "\\n")

format_print(..., sep = "\\n")

format_cat(..., sep = "\\n")

format_unboxed(...)

format_png(...)

format_jpeg(...)

format_tiff(...)

format_svg(...)

format_bmp(...)

format_pdf(...)
}
\arguments{
\item{...}{Further argument passed on to the internal formatting function.
See Details for information on which function handles the formatting
internally in each serializer}

\item{version}{the workspace format version to use.  \code{NULL}
    specifies the current default version (3). The only other supported
    value is 2, the default from \R 1.4.0 to \R 3.5.0.}

\item{ascii}{a logical.  If \code{TRUE} or \code{NA}, an ASCII
    representation is written; otherwise (default) a binary one.
    See also the comments in the help for \code{\link[base]{save}}.}

\item{sep}{The separator between multiple elements}
}
\value{
A function accepting the response body
}
\description{
These functions cover a large area of potential response body formats. They
are all registered to their standard mime type but users may want to use
them to register them to alternative types if they know it makes sense.
}
\section{Provided serializers}{
\itemize{
\item \code{format_csv()} uses \code{\link[readr:format_delim]{readr::format_csv()}} for formatting. It is registered
as \code{"csv"} to the mime type \code{text/csv}
\item \code{format_tsv()} uses \code{\link[readr:format_delim]{readr::format_tsv()}} for formatting. It is registered
as \code{"tsv"} to the mime type \code{text/tsv}
\item \code{format_rds()} uses \code{\link[=serialize]{serialize()}} for formatting. It is registered as
\code{"rds"} to the mime type \code{application/rds}
\item \code{format_geojson()} uses \code{geojsonsf::sfc_geojson()} or \code{geojsonsf::sf_geojson()}
for formatting depending on the class of the response body. It is
registered as \code{"geojson"} to the mime type \code{application/geo+json}
\item \code{format_feather()} uses \code{arrow::write_feather()} for formatting. It is
registered as \code{"feather"} to the mime type
\code{application/vnd.apache.arrow.file}
\item \code{format_parquet()} uses \code{nanoparquet::write_parquet()} for formatting. It is
registered as \code{"parquet"} to the mime type \code{application/vnd.apache.parquet}
\item \code{format_yaml()} uses \code{\link[yaml:as.yaml]{yaml::as.yaml()}} for formatting. It is registered
as \code{"yaml"} to the mime type \code{text/yaml}
\item \code{format_htmlwidget()} uses \code{htmlwidgets::saveWidget()} for formatting. It is
registered as \code{"htmlwidget"} to the mime type \code{text/html}
\item \code{format_format()} uses \code{\link[=format]{format()}} for formatting. It is registered
as \code{"format"} to the mime type \code{text/plain}
\item \code{format_print()} uses \code{\link[=print]{print()}} for formatting. It is registered
as \code{"print"} to the mime type \code{text/plain}
\item \code{format_cat()} uses \code{\link[=cat]{cat()}} for formatting. It is registered
as \code{"cat"} to the mime type \code{text/plain}
\item \code{format_unboxed()} uses \code{\link[reqres:formatters]{reqres::format_json()}} with \code{auto_unbox = TRUE} for
formatting. It is registered as \code{"unboxedJSON"} to the mime type
\code{application/json}
}
\subsection{Additional registered serializers}{
\itemize{
\item \code{\link[reqres:formatters]{reqres::format_json()}} is registered as "\code{json}" to the mime type
\code{application/json}
\item \code{\link[reqres:formatters]{reqres::format_html()}} is registered as "\code{html}" to the mime
type \code{text/html}
\item \code{\link[reqres:formatters]{reqres::format_xml()}} is registered as "\code{xml}" to the mime type
\code{text/xml}
\item \code{\link[reqres:formatters]{reqres::format_plain()}} is registered as "\code{text}" to the mime type
\code{text/plain}
}
}
}

\section{Provided graphics serializers}{
Serializing graphic output is special because it requires operations before
and after the handler is executed. Further, handlers creating graphics are
expected to do so through side-effects (i.e. call to graphics rendering) or
by returning a ggplot2 object. If you want to create your own graphics
serializer you should use \code{\link[=device_formatter]{device_formatter()}} for constructing it.
\itemize{
\item \code{format_png()} uses \code{\link[ragg:agg_png]{ragg::agg_png()}} for rendering. It is registered
as \code{"png"} to the mime type \code{image/png}
\item \code{format_jpeg()} uses \code{\link[ragg:agg_jpeg]{ragg::agg_jpeg()}} for rendering. It is registered
as \code{"jpeg"} to the mime type \code{image/jpeg}
\item \code{format_tiff()} uses \code{\link[ragg:agg_tiff]{ragg::agg_tiff()}} for rendering. It is registered
as \code{"tiff"} to the mime type \code{image/tiff}
\item \code{format_svg()} uses \code{\link[svglite:svglite]{svglite::svglite()}} for rendering. It is registered
as \code{"svg"} to the mime type \code{image/svg+xml}
\item \code{format_bmp()} uses \code{\link[grDevices:png]{grDevices::bmp()}} for rendering. It is registered
as \code{"bmp"} to the mime type \code{image/bmp}
\item \code{format_pdf()} uses \code{\link[grDevices:pdf]{grDevices::pdf()}} for rendering. It is registered
as \code{"pdf"} to the mime type \code{application/pdf}
}
}

\seealso{
\code{\link[=register_serializer]{register_serializer()}}
}
