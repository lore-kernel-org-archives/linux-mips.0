Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: olson@anchor.engr.sgi.com (Dave Olson)
Message-ID: <199901250406.UAA07213@anchor.engr.sgi.com>
Subject: Re: HAL2 support.
In-Reply-To: <Pine.LNX.3.96.990124153515.17852A-100000@lager.engsoc.carleton.ca> from Alex deVries at "Jan 24, 99 04:01:19 pm"
Date: Sun, 24 Jan 1999 20:06:09 -0800 (PST)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: Alex deVries <adevries@engsoc.carleton.ca>
Cc: linux@cthulhu.engr.sgi.com
Message-ID: <19990125040609.3zLT1kqmybrg5a_4JzoCjjrySiWSki7rxlOZpJfsXzw@z>

Alex deVries wrote: 
|  Also, am I right in saying that there's no devices written for HPC3 that
|  use the pbus?  Looks like the first step to writing a HAL driver is to be
|  able to write to the pbus.

The pbus interface itself is a pretty simple interface.

|  What else is actually on the pbus on the Indy?  From this HPC
|  documentation, looks
|  like:
|  - fdc (I thought Indy floppies were SCSI though)

There was talk of doing floppy this way, but it never was actually done.

|  - rtc
|  - prom
|  - scsi (although not the 33c93)

scsi is off the hpc3, but it's only the control path (pio to registers)
that uses the pbus interface.  The datapath is a different bus.

|  - int2 (what's this?)

interrupt control.

|  - hal2
|  - pi1 (what's this?)

parallel port.

Dave Olson, Silicon Graphics
http://reality.sgi.com/olson   olson@sgi.com
