Date: Mon, 10 Feb 2003 12:26:45 +0100
From: Guido Guenther <agx@gandalf.physik.uni-konstanz.de>
Subject: Re: porting arcboot
Message-ID: <20030210112645.GA32696@honk.physik.uni-konstanz.de>
References: <20030210034549.GA8408@pureza.melbourne.sgi.com> <Pine.LNX.4.21.0302101120390.1117-100000@melkor> <20030210111330.GA32276@honk.physik.uni-konstanz.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20030210111330.GA32276@honk.physik.uni-konstanz.de>
Return-Path: <guido@honk1.physik.uni-konstanz.de>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Vivien Chappelier <vivienc@nerim.net>, linux-mips@linux-mips.org
Message-ID: <20030210112645.P5AwGgS1LLJqPZOIGcys9ChUE157TPwyj1jwV0Y8ibA@z>

On Mon, Feb 10, 2003 at 12:13:30PM +0100, Guido Guenther wrote:
> Can't we read the load address (and needed space) from the elf header
s/load address/kernel's load address/
> before InitMalloc? Would be much nicer and we don't need a different
> loader for every subarch.
In case we find a unique place for arcboot in the memory map of the
different subarches.
Regards,
 -- Guido
