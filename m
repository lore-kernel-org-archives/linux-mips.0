Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: olson@anchor.engr.sgi.com (Dave Olson)
Message-ID: <199906111831.LAA05198@anchor.engr.sgi.com>
Subject: Re: Belated Feedback:  HAL2
In-Reply-To: <19990611202821.C22699@thepuffingroup.com> from Ulf Carlsson at "Jun 11, 99 08:28:21 pm"
Date: Fri, 11 Jun 1999 11:31:26 -0700 (PDT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: Ulf Carlsson <ulfc@thepuffingroup.com>
Cc: mikehill@hgeng.com, linux@cthulhu.engr.sgi.com
Message-ID: <19990611183126.FI5aI9Ru2py0yNeFvk1uo306Vlo79R1aDKNL9hn0DFY@z>

Ulf Carlsson wrote: 
|  We beat IRIX, that sound great to me ;-)

The singlespeed cdrom drive was very touchy; it was the first generation
drive to support audio data over scsi.  It's unlikely to be a RAM limitation,
but who knows, at this point...

|  I'm interested in how this CD playback works. Does it read raw data from the CD
|  drive and just play it on the HAL2 or are there some other and smarter ways of

It reads the audio data over scsi, converts it if needed, and sends it
through the audio system.


Dave Olson, Silicon Graphics
http://reality.sgi.com/olson   olson@sgi.com
