Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B512AEEB
	for <linux-mips@vger.kernel.org>; Fri,  2 Oct 2026 09:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790934819; cv=none; b=hN5qPiatG86AkAmlmZMhPAUcMysV/l9LsTwd2/n44UkrfhVWZ8kXEzItIWahM/UIw3Nls0Eg1onLchdxwx3IMZ8uiIwkf0gUGvvNcgaQpXbRnb6fd8fyjyaQ2b3vcylQ4zSLZb8SroN4igaDzegLj5VC4KJuFHKFCbTQ+ZwxYLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790934819; c=relaxed/simple;
	bh=zt3Vto8vq19QPh6KBS6XymZhc2OLvztLzf1Qnpyz4zY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f50G/OMEb6OMvDg66D2pnhsgPPuj+jNerZUQONdkN9rsF9obbFNQyARtYJRiBKrSZoQ/ccAz9t5ZUTVfknxRWqA/rfu0hgIR6zfY9irOsps9SiG2Ibrs529cgAjZvMEXzTa6vxs1RH50AsL/1nileX5VkASTmBUoCj4wFTSug9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qoCb4Zyh; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qoCb4Zyh"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-4a003bd18e5so29810435e9.0
        for <linux-mips@vger.kernel.org>; Fri, 02 Oct 2026 02:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790934815; x=1791539615; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uNC9YCP8AT7IxNNn4b5VtrbR3K2PgY3ERGLBHswr9ww=;
        b=qoCb4ZyhM6d94X00v+OcJ+83zrA1fVq9aFe+IDFoSMNbDmCUwt3FtRTfRNzntcV6Xu
         isgDKuSI9UrGgUoiJrq/ALqSM5gf30gk73/F5wBU8P/rsFTozWnVIO5+wWmZvWG1BjPA
         D7N2tBLK6eAMCe7H40XOUZzfaG1z1XwM/1WRXkoiM1/5oIFay4T9imUnfoikGZSW1ipB
         FGjDBSEILdKQfO+8u7x8/jW+Av73I9rNHgPkaC+w5hod9WYkzaUYvGfP+MWzx4JU8hQD
         QelYt/H+lracsgB2B6dnrgg1B0+zuIT8NEJowynBr0QesrXPFhbvozpRue0Cv8MdbpBU
         Vgtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790934815; x=1791539615;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uNC9YCP8AT7IxNNn4b5VtrbR3K2PgY3ERGLBHswr9ww=;
        b=D9QT3DVOxNko40W07Rw4MkWw/MR7U+WNMT+5bFxDgeg2PF2Sx5QtfHXDknGqMea7/8
         3BLU+XFwyguN0VjdUEvjQCgIi2WTFhzCgRBQt/oepK4JaBfPXtQ0lIQT/buxbmvhTZ/u
         BOt95PRK5Sh+iFaxrKCSINjvMnCv4HjDC7bDKtersRvepWUpze0umo/CPjNpyJ2jGcjU
         7CCIRKObjDfVT8kDC4ZEUjrPThX4MyNdW//AAGU8gQ0sBLd6R6OLNEHysG2H6EdLPggZ
         Hhp+svdVff0mxles+4RxwT+wCoEw07hCc+WNwFC68zlXuhtUDAnRpWw5nmreK1KCAGTL
         4GYA==
X-Forwarded-Encrypted: i=1; AKwUvBwwRKGNJHH3eEfakCA9XyHqRjasIcl8vLuB1+JnAGcj2w9fxCEmrbom6zYoTMu85do6QohcSa10fkn/@vger.kernel.org
X-Gm-Message-State: AFuF++nBoPIWOCDZcVwMyw9JouRUmU9BuW27wwMTgoEWzmBE+aCGnxcz
	5fHknLkSrArvefqJeUI7/qWN01eJisrWCeCBxhOOvCDjjLKKFazV0f65
X-Gm-Gg: AYBFou2UphV6zTMLYsgqA0RaSMBuqf8Nkor9RMWTJwlHy+h9b1ZsKVxpz91cb6JCtjC
	h8Lx7PFkjsksFAq5OWXv9JIdkHF025l8rv60c50FUEVQVH2TaqFTs07+MpFtoiMDXN8Kmt5a8+R
	PQhFOD1uXAMvlmI7eMAHsFbSwEm54ILPtnJDs6XsfFnaipsrp06dnXAHdf8Oqp8UeWP+qt8oopS
	3dncofxu4tAPdTNGXfQ+C8QsIUii6hfu3tzN4FL3oGGkbwonzySxEa/HvDgQQCDF7ZkG+P64XIB
	oUEOklMYATEzx40x9/0uBfgGdfHMr1E/gXUSL0EMP8ydgSG/xBd/ArJKwvztE0sDm8upLQatQ0U
	YC/fDeg5QmEy0WXAXYD7vOplEQ7wQxRO9Pw2foq0ohze6Cw1v5DnAjcLjlb5LhkJ1hHRkJzqEAe
	IbIJosn0dEviVqhRr4yHT4BdbbfwRN1yKsS8kZSAacUskVNnM6XtrzWSPFLMcWNMV1jMg1SbPLQ
	1nnOtunKlqLvrhW5M0sstKRgAXM+CJ3mpdB4MHr3wCrmA==
X-Received: by 2002:a05:600c:1f87:b0:4a0:1efa:c74c with SMTP id 5b1f17b1804b1-4a0275a1d54mr38515505e9.20.1790934814461;
        Fri, 02 Oct 2026 02:53:34 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a02854073csm58305185e9.3.2026.10.02.02.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 02:53:34 -0700 (PDT)
Date: Fri, 2 Oct 2026 10:53:33 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Pedro Falcato <pfalcato@suse.de>
Cc: Andrew Morton <akpm@linux-foundation.org>, kernel test robot
 <lkp@intel.com>, Josh Law <objecting@objecting.org>,
 oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, Linux Memory
 Management List <linux-mm@kvack.org>, linux-mips@vger.kernel.org, Bradley
 Morgan <brads@mainlining.org>
Subject: Re: arch/mips/boot/compressed/decompress.c:undefined reference to
 `__ashldi3'
Message-ID: <20261002105333.6f77abd0@pumpkin>
In-Reply-To: <ar4050mdKL_W8yI9@pedro-suse.tail5790ac.ts.net>
References: <202609301826.MFaFMsmd-lkp@intel.com>
	<20260930120159.7e4f29a82d461bd8b040454e@linux-foundation.org>
	<ar4050mdKL_W8yI9@pedro-suse.tail5790ac.ts.net>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 1 Oct 2026 11:30:09 +0100
Pedro Falcato <pfalcato@suse.de> wrote:

> On Wed, Sep 30, 2026 at 12:01:59PM -0700, Andrew Morton wrote:
> > On Wed, 30 Sep 2026 18:36:50 +0200 kernel test robot <lkp@intel.com> wrote:
> >   
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > > head:   551c722f40809618230001baccf219193e22fc5a
> > > commit: d4dba3b9c03a326cfa73833d6b166aeb442f82b5 lib: decompress_bunzip2: fix 32-bit shift undefined behavior
> > > date:   6 months ago
> > > config: mips-randconfig-r2300-20260930 (https://download.01.org/0day-ci/archive/20260930/202609301826.MFaFMsmd-lkp@intel.com/config)
> > > compiler: mips-linux-gcc (GCC) 15.2.0
> > > sparse: v0.6.5-rc1
> > > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260930/202609301826.MFaFMsmd-lkp@intel.com/reproduce)
> > > 
> > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > the same patch/commit), kindly add following tags
> > > | Fixes: d4dba3b9c03a ("lib: decompress_bunzip2: fix 32-bit shift undefined behavior")
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202609301826.MFaFMsmd-lkp@intel.com/
> > > 
> > > All errors (new ones prefixed by >>):
> > > 
> > >    mips-linux-ld: arch/mips/boot/compressed/decompress.o: in function `get_bits':  
> > > >> arch/mips/boot/compressed/decompress.c:(.text+0xf4): undefined reference to `__ashldi3'
> > > >> mips-linux-ld: arch/mips/boot/compressed/decompress.c:(.text+0x168): undefined reference to `__ashldi3'  
> > 
> > I dunno, I'd be suspecting a toolchain issue here?
> > 
> > --- a/lib/decompress_bunzip2.c
> > +++ b/lib/decompress_bunzip2.c
> > @@ -135,7 +135,7 @@ static unsigned int INIT get_bits(struct bunzip_data *bd, char bits_wanted)
> >  		}
> >  		/* Avoid 32-bit overflow (dump bit buffer to top of output) */
> >  		if (bd->inbufBitCount >= 24) {
> > -			bits = bd->inbufBits&((1 << bd->inbufBitCount)-1);
> > +			bits = bd->inbufBits & ((1ULL << bd->inbufBitCount) - 1);
> >  			bits_wanted -= bd->inbufBitCount;
> >  			bits <<= bits_wanted;
> >  			bd->inbufBitCount = 0;
> > @@ -146,7 +146,7 @@ static unsigned int INIT get_bits(struct bunzip_data *bd, char bits_wanted)
> >  	}
> >  	/* Calculate result */
> >  	bd->inbufBitCount -= bits_wanted;
> > -	bits |= (bd->inbufBits >> bd->inbufBitCount)&((1 << bits_wanted)-1);
> > +	bits |= (bd->inbufBits >> bd->inbufBitCount) & ((1ULL << bits_wanted) - 1);
> >  
> >  	return bits;
> >  }
> > 
> > 32-bit MIPS should be able to do this?  
> 
> FWIW the patch seems entirely bogus. I don't think you can have inbufBitCount >=
> 32. If you could, then the patch would still not fix anything, because
> bd->inbufBits is an (32-bit) unsigned int.

The 1 should probably be 1U (or possibly 1UL is 64bit values can happen on
64bit) rather than 1ULL.

Wasn't the problem being solved '1 << 31' being undefined (or UB) and one of
the static checkers deciding that should never shift a signed value left?
That is entirely bogus anyway.
It is only non-portable because C allows 1's compliment and sign overpunch
for negative integers, gcc supports neither (and I think the next C standard
mandates 2's compliment).

That is separate from shift right of negative values being UB to allow for
cpu that don't have a sign replicating shift (all modern ones do).
Think about it, for a shift/rotate left you need one of 0/carry/high-bit and
for shift right 0/carry/low-bit so two instruction bits can select one of
0/carry/low-bit/high-bit (giving the often implemented but undocumented shift
left that replicates the low bit).

David

> 
> As per MIPS itself, MIPS does not link ashldi3.o into the decompressor for BZ2.
> It only does so for XZ and ZSTD.
> 
> Changing arch/mips/boot/compressed/Makefile would work, but since the change is
> entirely wrong I would suggest perhaps reverting?
> 
> 

