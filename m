Message-ID: <02a901c0ed2b$2eac6300$0deca8c0@Ulysses>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <3B1BC6B8.C58758FA@palmchip.com>
Subject: Re: dcache_blast() bug?
Date: Mon, 4 Jun 2001 21:18:39 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: Ian Thompson <iant@palmchip.com>, linux-mips@oss.sgi.com
Message-ID: <20010604191839.78UJajLrDFxcbYCtnGR-1_F9J0y36kJTkuvkE_MC7_I@z>

What processor are you running?

            Kevin K.

----- Original Message ----- 
From: "Ian Thompson" <iant@palmchip.com>
To: <linux-mips@oss.sgi.com>
Sent: Monday, June 04, 2001 7:34 PM
Subject: dcache_blast() bug?


> 
> Hi all,
> 
> I'm seeing some odd memory behavior around the time when blast_dcache()
> is called, leading me to think that the method may be a little buggy. 
> It appears that memory is being corrupted (consistently so) over the
> course of flushing the dcache.  This happens to my command line argument
> string - arcs_cmdline.  Before the blast_dcache() call, it is
> "console=ttyS0 ramdisk_start=0x9fcf0000 load_ramdisk=1", and after the
> call, the corrupted data is "ttyS0 ra0".  I take it this isn't supposed
> to happen?  any ideas of why the writeback_invalidate_d cache operation
> may be losing data?
> 
> thanks,
> -ian
> 
> 
> -- 
> ----------------------------------------
> Ian Thompson           tel: 408.952.2023
> Firmware Engineer      fax: 408.570.0910
> Palmchip Corporation   www.palmchip.com
