Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: Ralf Baechle <ralf@mailhost.uni-koblenz.de>
Message-ID: <199705301734.TAA14229@informatik.uni-koblenz.de>
Subject: Re: ah...
Date: Fri, 30 May 1997 19:34:01 +0200 (MET DST)
In-Reply-To: <199705301517.LAA13588@neon.ingenia.ca> from "Mike Shaver" at May 30, 97 11:17:00 am
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: Mike Shaver <shaver@neon.ingenia.ca>
Cc: linux@cthulhu.engr.sgi.com
Message-ID: <19970530173401.TblSBrSfmT4l940Wh0KsjrFTj48L9bHMZ69c67gELzs@z>

> I think something's a bit wonky here.
> 
>   if ((fd = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP)) < 0) {
>     perror("nothingserv: socket");
>     return -1;
>   }
> # ./bind-indy 2000
> nothingserv: socket: Socket type not supported
> #

Hurz...  Looks like you either you disabled TCI/IP networking or libc
and the kernel use different constants for the arguments of socket(2).

  Ralf
