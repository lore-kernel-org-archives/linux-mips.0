Message-ID: <013401c1ebb1$12e39cd0$4c00a8c0@prefect>
From: "Bradley D. LaRonde" <brad@ltc.com>
References: <3CC6CC21.45E7ABB1@mvista.com>
Subject: Re: ps2 keyboard -- no key down events
Date: Wed, 24 Apr 2002 12:57:09 -0400
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: michael_pruznick@mvista.com, linux-mips@oss.sgi.com
Message-ID: <20020424165709.Wyno7NV5FqFkv91l3XRNUrtpPNVmIqYNpMNahPeSeaI@z>

Could it be a level-trigger versus edge-trigger interrupt setting?

Regards,
Brad

----- Original Message ----- 
From: "Michael Pruznick" <michael_pruznick@mvista.com>
To: <linux-mips@oss.sgi.com>
Sent: Wednesday, April 24, 2002 11:15 AM
Subject: ps2 keyboard -- no key down events


> I'm working on this mips board with a smsc 90e66 south bridge and
> fdc37m812 super io.  I'm using the standard pc_keyb.c driver.  I only
> see keyboard interrupts and KBD_STAT_OBF set in response to "key up"
> events.  I never see them in response to "key down" events.  Thus, the
> shell running on the vga console never gets my input (since it is the
> "key down" events that pass the character typed to the shell).
> 
> At this point, I'm thinking that the standard driver needs some mods
> to work with the super io's ps2 controller.  The smsc doc only covers
> programming the plug and play registers and doesn't give any info about
> programming the ps2 controller.
> 
> I've looked around the web, but haven't found anything useful.
> 
> Can anyone point me towards some resources that might help out?
> 
> -- 
> Michael Pruznick, michael_pruznick@mvista.com, www.mvista.com
> MontaVista Software, 1237 East Arques Ave, Sunnyvale, CA 94085
> 
