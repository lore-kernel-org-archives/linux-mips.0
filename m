Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43C3747B431;
	Wed, 15 Jul 2026 15:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784130306; cv=none; b=h1a277TnU25njQcT+38NuVE9luG7UXZooQr/6P0wcaCMU6vKUybepqhF68W3+7LXqAVsQZnvukTXvWWNsArHG0N78z9P/MH4nqUnebYWI1oaYdlDMrA8mUN7ImGheibqd7Gg/PY64Qq279W5/0hBJdZsLGrMsGiW5RCLgkPPgE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784130306; c=relaxed/simple;
	bh=ITO88rx3FAKg0WpgHfsZj8AYqg0U12Om30kgDKKx9JE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EXac/51LNLGaV1wgXfAWf+8BOd+j5CrLPypDjE8xtQg9pjQxyADruxPwMDCXCDv+yoLuxfQpHHLltvCFIp2yBEKZM2NKb9229hJkc0BZrNvxsmT9GKJI2GAfNipN1ca2n3oMeB4N8cm9helCowEGGKV3TfS0TGmaYoW67eS8R5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1wk1n4-00089B-00; Wed, 15 Jul 2026 17:44:54 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id F00E9C00E8; Wed, 15 Jul 2026 17:44:44 +0200 (CEST)
Date: Wed, 15 Jul 2026 17:44:44 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/1] MIPS: Alchemy: Remove unused forward declaration
Message-ID: <aleq7AHSEG7H1asl@alpha.franken.de>
References: <20260715150551.1239925-1-andriy.shevchenko@linux.intel.com>
 <CAMRc=Mf_WVU__qRuv5zBpTcrZDewfVCUN0aXLOft5csv7OWRnw@mail.gmail.com>
 <alelCeG0r8c8Mq94@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alelCeG0r8c8Mq94@ashevche-desk.local>

On Wed, Jul 15, 2026 at 06:19:37PM +0300, Andy Shevchenko wrote:
> On Wed, Jul 15, 2026 at 08:08:00AM -0700, Bartosz Golaszewski wrote:
> > On Wed, 15 Jul 2026 17:03:48 +0200, Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> said:
> 
> ...
> 
> > > Cc: Bartosz Golaszewski <brgl@kernel.org>
> > >
> > > This patch is floating around for more than a year without anybody
> > > taking it! Please, please, do something about this. Since it has
> > > an ack by MIPS maintainer, Bart, can you just pick this up?
> 
> > Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> 
> Thanks, and sorry for the noise, I was cleaning an old branch and actually this
> had been applied already. Sorry again, I need some vacation (which will happen
> in a week).

d1d0aa620a0f MIPS: Alchemy: Remove unused forward declaration

I took it last merge window, or do I miss something ?

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
