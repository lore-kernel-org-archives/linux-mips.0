Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B46C27FD4F;
	Fri,  2 Oct 2026 01:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790903233; cv=none; b=g4+JP9ThDI7OnoaJimMmx4FPEhh2+wEu/cM6yTv9J7sVrhOiGrIpiC37NulkNvwMXomv4lQFPZkZIQswvVxfmewFVZgwMT04edBOZyr+75qdLq6MCzBiY/WRVyQ1yGYXWoEqaU1ykUBvE4d6riBhhKx80RoADGFPd5bIkG6zJUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790903233; c=relaxed/simple;
	bh=vJWsqglVWkLpXsLvVNa+Jjyf5X3QYKC24TSuQZyV0ZQ=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=fMtXOxgamBJqbJr1BmHjF3knsd6H4txUKeKjCTBbWQX7sRAMHtiO3D1uYeKbgBK6dZBBBGVFuPwSwvLldd1A3+kyJd1AsrgbbfdSksNAwYWkJTImgPUzFdlL/W9acghczuVNSLhSgj4MifEHnYyr0Wnu+Hp70UL7EI8PL0/zkiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=TlGtHfJT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="TlGtHfJT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8964D1F000FF;
	Fri,  2 Oct 2026 01:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1790903231;
	bh=2AK8IZM9OOCadsoGaRMWdYbctWhkNoTiiNTA/D93z4g=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=TlGtHfJT7BTCwfl7UgRhCotCOBkzppHZETcMeSBZuLUFP3y9S/xHMT/eRWGVg7sDW
	 CfTJl8T5zrYYYjNZPYEzeEmhwh3AfuyDJDlG8dB6E7O2gWWX8EI6+9w4MXPMUxnhq9
	 55baiGIVQw0377SKq2g/4cdZ1UQoeo0EtjpbtnUw=
Date: Thu, 1 Oct 2026 18:07:11 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Pedro Falcato <pfalcato@suse.de>
Cc: kernel test robot <lkp@intel.com>, Josh Law <objecting@objecting.org>,
 oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, Linux Memory
 Management List <linux-mm@kvack.org>, linux-mips@vger.kernel.org, Bradley
 Morgan <brads@mainlining.org>
Subject: Re: arch/mips/boot/compressed/decompress.c:undefined reference to
 `__ashldi3'
Message-Id: <20261001180711.b206ee7ab13a1cadafdba4e7@linux-foundation.org>
In-Reply-To: <ar4050mdKL_W8yI9@pedro-suse.tail5790ac.ts.net>
References: <202609301826.MFaFMsmd-lkp@intel.com>
	<20260930120159.7e4f29a82d461bd8b040454e@linux-foundation.org>
	<ar4050mdKL_W8yI9@pedro-suse.tail5790ac.ts.net>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 1 Oct 2026 11:30:09 +0100 Pedro Falcato <pfalcato@suse.de> wrote:

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
> 
> As per MIPS itself, MIPS does not link ashldi3.o into the decompressor for BZ2.
> It only does so for XZ and ZSTD.
> 
> Changing arch/mips/boot/compressed/Makefile would work, but since the change is
> entirely wrong I would suggest perhaps reverting?

Sure, thanks.  Do you have time to send a formal patch?
