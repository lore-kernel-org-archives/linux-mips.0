Return-Path: <owner-linux@cthulhu.engr.sgi.com>
Message-ID: <199807161617.SAA14485@aisa.fi.muni.cz>
Subject: Installing noarch packages
In-Reply-To: <199807161439.QAA10960@aisa.fi.muni.cz> from Honza Pazdziora at "Jul 16, 98 04:39:53 pm"
Date: Thu, 16 Jul 1998 18:17:57 +0200 (MET DST)
From: Honza Pazdziora <adelton@informatics.muni.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: Honza Pazdziora <adelton@informatics.muni.cz>
Cc: adevries@engsoc.carleton.ca, linux@cthulhu.engr.sgi.com
Message-ID: <19980716161757.aUPgpSg9FphKFbU0Sihm-5Dp8F9MEUO-yFHaieJ5qHU@z>


Hello,

when I try to install automake-1.3-2.noarch.rpm, I get

package automake-1.3-2 is for a different architecture
error: automake-1.3-2.noarch.rpm cannot be installed

This is with rpm version 2.5.1 from HH 5.1 PR distribution. I even
tried to build the automake rpm from src, got rpm fine but then
ended with the same message. So I assume there is something wrong
not with the noarch packages but with the rpm.

BTW: the swap really is recognized and mounted during boot. So
probably the only fix that is needed is to get rid of that menu
Repartition / Continue (or change conditions upon which it is
displayed).

------------------------------------------------------------------------
 Honza Pazdziora | adelton@fi.muni.cz | http://www.fi.muni.cz/~adelton/
                   I can take or leave it if I please
------------------------------------------------------------------------
