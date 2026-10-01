Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 016813F8709;
	Thu,  1 Oct 2026 10:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790850624; cv=none; b=uvIcGuWXmrRqQlTYNvT+OCV3brbn8t5/r26pBFsolEh2uz0bUSTP1yK1WIbsB3dbi0pEEi9jA4xIxVVjsI60C0KxKQqwPPqfe7iGzqN2TzjE7U2w6ovGJ95e2esTZN0XinnSeXJv4F9quSpBQ+t4hCsEY3YDAffWXKY/JdYeZhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790850624; c=relaxed/simple;
	bh=p9w+LwSRg0HNfV5Yp+rq7S/58vD+u2OXDzxX+kUS98A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u8P4MlxvzJcDoAeq2HGkDzCuH2zvshkm8BOW0ehywtPkfeU0rJQ434LsdJHe1H+ayIhQD6vzi1iN4H50Z2OmzwSax8smHK7PpEB2ykyQkjkpdFpmdg5WZ7dsn8yFjpdEBt0hJHY3+IxLUU1j+FHS0fdhq3uCWziesEsb6zqnVtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=i0snoJfx; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=hgEpxfmA; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=TxfXvwt9; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=hEU3N97n; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="i0snoJfx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hgEpxfmA";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TxfXvwt9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hEU3N97n"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id AE21E21EC6;
	Thu,  1 Oct 2026 10:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790850615; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DwZ290wnSkIXwUpp85i6pDwiw21bE+flaTKN+OYvr4o=;
	b=i0snoJfxSxpQ6DQu8h/GdZ/PgAtw/ecP5/inHGdWSDMLt8WeS9ATPC+mQGaCJKoh3k0e0+
	Ukt/XTodtHbVv8m0JQ4pkKZ0OzDpBoCOuWsySnpXXPMNmjI/2227U/dDv6gP420ZjkvK/q
	JOMwB3bk8R6pNFCs6zXy25XWM227kIQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790850615;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DwZ290wnSkIXwUpp85i6pDwiw21bE+flaTKN+OYvr4o=;
	b=hgEpxfmAQmTTFbpLxw3fJiNuZSn2AJEJM0imp7u4aseHY+opU6npznHEWDbBz2eBfTOHMi
	lI8DJNrVfaIzCGBg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790850611; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DwZ290wnSkIXwUpp85i6pDwiw21bE+flaTKN+OYvr4o=;
	b=TxfXvwt9Ni0K8hSE1wlRUnC/XnI2V913Ti5KTYPEi54mFrG2BZjD2SEmLQ4aHwX27vI1FF
	ha2XuJJS2yC+hVGSoW145TwF7ndlqu71WKMMrlv2A36sM1JNT0LXasYEMmfkC9/I6os3/n
	oJHemLa0DL7jlEZ+bhB/uLw7sfQ6LTQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790850611;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DwZ290wnSkIXwUpp85i6pDwiw21bE+flaTKN+OYvr4o=;
	b=hEU3N97nPglpmGyM3ugMExixlrbwcLfo9Imqjda2eZMMFrt71vgSfvsW+lA4dszwC4zL9O
	7xsSfQ97U0IiwNCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EC8FA134B3;
	Thu,  1 Oct 2026 10:30:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 9RwjLjI2vmpKawAAD6G6ig
	(envelope-from <pfalcato@suse.de>); Thu, 01 Oct 2026 10:30:10 +0000
Date: Thu, 1 Oct 2026 11:30:09 +0100
From: Pedro Falcato <pfalcato@suse.de>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: kernel test robot <lkp@intel.com>, Josh Law <objecting@objecting.org>, 
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Linux Memory Management List <linux-mm@kvack.org>, linux-mips@vger.kernel.org, 
	Bradley Morgan <brads@mainlining.org>
Subject: Re: arch/mips/boot/compressed/decompress.c:undefined reference to
 `__ashldi3'
Message-ID: <ar4050mdKL_W8yI9@pedro-suse.tail5790ac.ts.net>
References: <202609301826.MFaFMsmd-lkp@intel.com>
 <20260930120159.7e4f29a82d461bd8b040454e@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930120159.7e4f29a82d461bd8b040454e@linux-foundation.org>
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[01.org:url,imap1.dmz-prg2.suse.org:helo,intel.com:email]
X-Spam-Flag: NO
X-Spam-Score: -4.30
X-Spam-Level: 

On Wed, Sep 30, 2026 at 12:01:59PM -0700, Andrew Morton wrote:
> On Wed, 30 Sep 2026 18:36:50 +0200 kernel test robot <lkp@intel.com> wrote:
> 
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > head:   551c722f40809618230001baccf219193e22fc5a
> > commit: d4dba3b9c03a326cfa73833d6b166aeb442f82b5 lib: decompress_bunzip2: fix 32-bit shift undefined behavior
> > date:   6 months ago
> > config: mips-randconfig-r2300-20260930 (https://download.01.org/0day-ci/archive/20260930/202609301826.MFaFMsmd-lkp@intel.com/config)
> > compiler: mips-linux-gcc (GCC) 15.2.0
> > sparse: v0.6.5-rc1
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260930/202609301826.MFaFMsmd-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Fixes: d4dba3b9c03a ("lib: decompress_bunzip2: fix 32-bit shift undefined behavior")
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202609301826.MFaFMsmd-lkp@intel.com/
> > 
> > All errors (new ones prefixed by >>):
> > 
> >    mips-linux-ld: arch/mips/boot/compressed/decompress.o: in function `get_bits':
> > >> arch/mips/boot/compressed/decompress.c:(.text+0xf4): undefined reference to `__ashldi3'
> > >> mips-linux-ld: arch/mips/boot/compressed/decompress.c:(.text+0x168): undefined reference to `__ashldi3'
> 
> I dunno, I'd be suspecting a toolchain issue here?
> 
> --- a/lib/decompress_bunzip2.c
> +++ b/lib/decompress_bunzip2.c
> @@ -135,7 +135,7 @@ static unsigned int INIT get_bits(struct bunzip_data *bd, char bits_wanted)
>  		}
>  		/* Avoid 32-bit overflow (dump bit buffer to top of output) */
>  		if (bd->inbufBitCount >= 24) {
> -			bits = bd->inbufBits&((1 << bd->inbufBitCount)-1);
> +			bits = bd->inbufBits & ((1ULL << bd->inbufBitCount) - 1);
>  			bits_wanted -= bd->inbufBitCount;
>  			bits <<= bits_wanted;
>  			bd->inbufBitCount = 0;
> @@ -146,7 +146,7 @@ static unsigned int INIT get_bits(struct bunzip_data *bd, char bits_wanted)
>  	}
>  	/* Calculate result */
>  	bd->inbufBitCount -= bits_wanted;
> -	bits |= (bd->inbufBits >> bd->inbufBitCount)&((1 << bits_wanted)-1);
> +	bits |= (bd->inbufBits >> bd->inbufBitCount) & ((1ULL << bits_wanted) - 1);
>  
>  	return bits;
>  }
> 
> 32-bit MIPS should be able to do this?

FWIW the patch seems entirely bogus. I don't think you can have inbufBitCount >=
32. If you could, then the patch would still not fix anything, because
bd->inbufBits is an (32-bit) unsigned int.

As per MIPS itself, MIPS does not link ashldi3.o into the decompressor for BZ2.
It only does so for XZ and ZSTD.

Changing arch/mips/boot/compressed/Makefile would work, but since the change is
entirely wrong I would suggest perhaps reverting?


-- 
Pedro
