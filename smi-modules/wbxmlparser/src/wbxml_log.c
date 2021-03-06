/*
 * WBXML Lib, the WBXML Library.
 * Copyright (C) 2002-2003  Aymerick J�hanne
 * 
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License (version 2.1) as published by the Free Software Foundation.
 * 
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 * 
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 *
 * LGPL v2.1: http://www.gnu.org/licenses/lgpl.txt
 *
 * Author Contact: libwbxml@jehanne.org
 * WBXML Lib home: http://libwbxml.jehanne.org
 */
 
/**
 * @file wbxml_log.c
 * @ingroup wbxml_log
 *
 * @author Aymerick J�hanne <libwbxml@jehanne.org>
 * @date 02/12/04
 *
 * @brief WBXML Log Functions
 */

#include "wbxml.h"


#ifdef WBXML_LIB_VERBOSE

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <stdarg.h>


/** Length of Log Buffer */
#define WBXML_LOG_FORMAt_SIZE 1024


/* Private Functions Prototypes */
static void format_log_message(WB_TINY *buf, WB_UTINY type, const WB_TINY *fmt);
static const WB_UTINY *get_type(WB_UTINY type);


/***************************************************
 *    Public Functions
 */

WBXML_DECLARE(void) wbxml_log_debug(WB_UTINY type, const WB_TINY *fmt, ...)
{
    char buf[WBXML_LOG_FORMAt_SIZE];
    va_list args;
    
    format_log_message(buf, type, fmt);
    
    va_start(args, fmt);
    vfprintf(stderr, buf, args);   
    va_end(args);
}

WBXML_DECLARE(void) wbxml_log_warning(WB_UTINY type, const WB_TINY *fmt, ...)
{
    char buf[WBXML_LOG_FORMAt_SIZE];
    va_list args;
    
    format_log_message(buf, type, fmt);
    
    va_start(args, fmt);
    vfprintf(stderr, buf, args);   
    va_end(args);
}

WBXML_DECLARE(void) wbxml_log_error(WB_UTINY type, const WB_TINY *fmt, ...)
{
    char buf[WBXML_LOG_FORMAt_SIZE];
    va_list args;
    
    format_log_message(buf, type, fmt);
    
    va_start(args, fmt);
    vfprintf(stderr, buf, args);   
    va_end(args);
}


/***************************************************
 *    Private Functions
 */

/**
 * @brief Format a Log Message
 * @param buf [out] Resulting formated buffer
 * @param type [in] Type of Message
 * @param fmt [int] Message to format
 */
static void format_log_message(WB_TINY *buf, WB_UTINY type, const WB_TINY *fmt)
{
    WB_TINY *p, prefix[WBXML_LOG_FORMAt_SIZE];
    
    p = prefix;
    
    sprintf(p, "%s> ", get_type(type));
    
    if (WBXML_STRLEN(prefix) + WBXML_STRLEN(fmt) > WBXML_LOG_FORMAt_SIZE / 2) {
	    sprintf(buf, "(LOG MESSAGE TOO LONG !)\n");
	    return;
    }
    
	sprintf(buf, "%s%s\n", prefix, fmt);    
}

/**
 * @brief Get a Message Type string
 * @param type [in] Type of Message
 * @return The string representation of the Message Type
 */
static const WB_UTINY *get_type(WB_UTINY type) 
{
    switch (type)
    {
        case WBXML_PARSER:
            return "WBXML Parser";
        
        case WBXML_ENCODER:
            return "WBXML Encoder";

        case WBXML_CONV:
            return "WBXML Converter";
        
        default:
            return "WBXML Unknown";
    }
}

#endif /* WBXML_LIB_VERBOSE */
