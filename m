Message-ID: <XFMail.000313200547.Harald.Koerfgen@home.ivm.de>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
In-Reply-To: <E12UVAr-0007rR-00@the-village.bc.nu>
Date: Mon, 13 Mar 2000 20:05:47 +0100 (MET)
Reply-To: "Harald Koerfgen" <Harald.Koerfgen@home.ivm.de>
From: Harald Koerfgen <Harald.Koerfgen@home.ivm.de>
Subject: Re: FP emulation patch available
Sender: owner-linuxmips@oss.sgi.com
Return-Path: <owner-linuxmips@oss.sgi.com>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: " (Linux SGI)" <linux@cthulhu.engr.sgi.com>, linux-mips@fnet.fr, linux-mips@vger.rutgers.edu, " (Kevin D. Kissell)" <kevink@mips.com>
Message-ID: <20000313190547.Qcqmvctkd8MS3rq4RiYBii9fabGI1tRH0wTeGvEYpH0@z>


On 13-Mar-00 Alan Cox wrote:
>> Does anyone out there actually need/want an SMP
>> version of the emulator?   It's not completely trivial,
>> but it would not be all that difficult to do...
> 
> If you dont do it please add
> 
>#ifdef CONFIG_SMP
>#error "Not on this emulator"
>#endif
> 
> to the emu code - for the person who didnt know 8)

harry:~ > grep CONFIG_SMP linux/arch/mips/config.in
harry:~ > grep CONFIG_SMP linux/arch/mips64/config.in
   bool '  Multi-Processing support (Experimental)' CONFIG_SMP

SCNR :-).
-- 
Regards,
Harald
