Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: Ralf Baechle <ralf@mailhost.uni-koblenz.de>
Message-ID: <199706161142.NAA04650@informatik.uni-koblenz.de>
Subject: Re: gcc for Irix.
Date: Mon, 16 Jun 1997 13:42:06 +0200 (MET DST)
In-Reply-To: <33A4F325.7DE1@munich.sgi.com> from "Martin Knoblauch" at Jun 16, 97 10:02:45 am
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: Martin Knoblauch <knobi@munich.sgi.com>
Cc: davem@jenolan.rutgers.edu, ariel@sgi.com, carlson@heaven.newport.sgi.com, linux@cthulhu.engr.sgi.com
Message-ID: <19970616114206.kZWNIVxXt5eU-JjArB4c6CW8CkUhsFm_kLbU_z88cic@z>

> >    And finally there's "fix_headers" - the utility that comes with gcc
> >    and fixes headers so they can be used with some gcc conventions and
> >    extensions to C.  Combine this with our multi-standard headers
> >    which I suspect the designers of "fix_headers" never thought of and
> >    you get a pretty cool mess :-)
> > 
> > Which is why in gcc-2.8.0 a completely new fix_headers.irix will
> > exist which handles it all properly...
> 
>  This is why we all eagerly wait to see an official release of 2.8 :-)

Let things settle down a bit.  I tried to install a snapshot some days
ago and had problems to bootstrap the compiler.  The thin is still
pretty buggy.

  Ralf
