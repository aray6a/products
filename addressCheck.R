library(stringr)
source("city.R")
source("state.R")
source("zipps.R")


addressCheck <- function( city, state, postal ) {

	cityRow <- cityDF[ cityDF$ORIGCITY == city, ]
	if ( length(cityRow$D) != 1 ) {
		domestic_city <- 0.5
	} else {
		domestic_city <- cityRow$D / ( cityRow$D + cityRow$F )
	}

	stateRow <- stateDF[ stateDF$ORGSTATE == state, ]
	if ( length(stateRow$D) != 1 ) {
		domestic_state <- 0.5
	} else {
		domestic_state <- stateRow$D / ( stateRow$D + stateRow$F )
	}

	zippRow <- zippsDF[ zippsDF$OZIP == postal, ]
	if( length(zippRow$D) != 1 ) {
		domestic_zipp <- 0.5
	} else {
		domestic_zipp <- zippRow$D / ( zippRow$D + zippRow$F )
	}

	domestic_uszip <- 1
	domestic_country <- 1
	# states <- read.csv("input/states.csv", colclasses = c('character', 'double', 'double') )
	# states <- states %>% mutate( domestic_states = d / (d + f) ) %>% select( orgstate, domestic_states)
	# adm <- left_join( adm, states, by = c( 'r.state' = 'orgstate') )
	# adm$domestic_states <- ifelse( is.na(adm$domestic_states), 0.5, adm$domestic_states )
	#
	# zipps <- read.csv("input/zipps.csv", colclasses = c('character', 'double', 'double') )
	# zipps <- zipps %>% mutate( domestic_zipps = d / (d + f) ) %>% select( ozip, domestic_zipps)
	# adm <- left_join( adm, zipps, by = c( 'r.zip5' = 'ozip') )
	# adm$domestic_zipps <- ifelse( is.na(adm$domestic_zipps), 0.5, adm$domestic_zipps )
	#
	# uszips <- read.csv("input/uszips.csv")
	# uszips <- uszips %>% mutate( domestic_uszips = d / (d + f) ) %>% select( uszip, domestic_uszips)
	# adm$uszip <- ifelse( str_length( adm$r.zip ) %in% c(5,9) | (str_length( adm$r.zip ) == 10 & str_detect( adm$r.zip, '-' ) ), t, f)
	# adm <- left_join( adm, uszips )
	# adm$domestic_uszips <- ifelse( is.na(adm$domestic_uszips), 0.5, adm$domestic_uszips )
	#
	#
	# countries <- read.csv("input/countries.csv", colclasses = c('character', 'double', 'double') )
	# countries <- countries %>% mutate( domestic_countries = d / (d + f) ) %>% select( orgcntry, domestic_countries)
	# adm$countrygrouping <- ifelse( adm$r.country != 'usa' & adm$r.country != 'unk', 'oth', adm$r.country )
	# adm <- left_join( adm, countries, by = c( 'countrygrouping' = 'orgcntry') )
	# adm$domestic_countries <- ifelse( is.na(adm$domestic_countries), 0.5, adm$domestic_countries )
	#
	# adm %>% mutate( domestic = ( 0.8 * domestic_cities * domestic_states * domestic_zipps * domestic_uszips * domestic_countries ), foreign = ( 0.2 * (1-domestic_cities) * (1-domestic_states) * (1-domestic_zipps) * (1-domestic_uszips) * (1-domestic_countries) ), df = domestic > foreign )

	domestic = ( 0.8 * domestic_city * domestic_state * domestic_zipp * domestic_uszip * domestic_country )
	domestic

}
