Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 825073AD52B;
	Wed, 15 Jul 2026 16:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784131311; cv=none; b=kMJABnYnCqN/o1oJ49v5iODBd++TijBRCXjmBDeXWRdjU8sSiHWvUj8XRI5aQhQapyEMkJJIQ8ez5FSkEEhrgcHIN5cj5nWNCkKaeSRyCjdOlWQm42DxN8YEzOO6tVAsncvDSmI24I9JJ9FHoLiUQJM4YhVS52Pb1NTnyrSCKM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784131311; c=relaxed/simple;
	bh=ANRAimZO1JWeawCUW01O7maDtNGt9eGZu+EGklIa5ck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LAjzq53tI4lfzpSXnUvNXsJkf0/uA9e7vHKhOno3a6Aq9PiXjw6Un3obOvoBdxgcOi9n8iY8WXQQdp7EvdJQzcgWF34uyP2kFwooC6I9QTnJl6jyQsmgLdNLSNfme07UuJNMR4dbs7vz+Hd97913knFPnZNBdhfkDwnc3wETgiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MPfstDEO; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MPfstDEO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784131309; x=1815667309;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ANRAimZO1JWeawCUW01O7maDtNGt9eGZu+EGklIa5ck=;
  b=MPfstDEO3AFZxvB7N9qchlgp5DKj0FunUPiydEM/B6InSBPyz4GzPWrF
   0IhwSw1++Ng0ytX6o6od+2qcZFR4RNUIigNBH88rHi8Xsz65/ZBLlxLAM
   U/1+h26rofYziMGyjfjeXRc/2hGlNyKgkpwYPyd3azUNOpATl7wycn3ou
   A2poVyOPIG4IgHfpBBDe2op1HL2ZvZaQhoEGD5QZrbMATGqMm/3N+9Rfu
   xAIy/FoUkkJc8cXn8TX4txrVnwDCYNDxN237RbCMJx2nLGQjbN1gzrIjz
   JyMMloZEWTeVk5SDm0eaqBXjWKqQJ0Jn5G4nC46Mj9RNYEsDI+dIZ4qwB
   w==;
X-CSE-ConnectionGUID: r4z9kvUmRliRmhoBJVzy9w==
X-CSE-MsgGUID: efaEy/QtTAGhO65MpaLDrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="107570273"
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; 
   d="scan'208";a="107570273"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 09:01:48 -0700
X-CSE-ConnectionGUID: POt73Y2fTLSC3iOcjacNLw==
X-CSE-MsgGUID: iPdVb8DlQpO5H/2wtd0zgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; 
   d="scan'208";a="260530241"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.129])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 09:01:46 -0700
Date: Wed, 15 Jul 2026 19:01:43 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/1] MIPS: Alchemy: Remove unused forward declaration
Message-ID: <aleu53IKocaWGo4r@ashevche-desk.local>
References: <20260715150551.1239925-1-andriy.shevchenko@linux.intel.com>
 <CAMRc=Mf_WVU__qRuv5zBpTcrZDewfVCUN0aXLOft5csv7OWRnw@mail.gmail.com>
 <alelCeG0r8c8Mq94@ashevche-desk.local>
 <aleq7AHSEG7H1asl@alpha.franken.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aleq7AHSEG7H1asl@alpha.franken.de>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Jul 15, 2026 at 05:44:44PM +0200, Thomas Bogendoerfer wrote:
> On Wed, Jul 15, 2026 at 06:19:37PM +0300, Andy Shevchenko wrote:
> > On Wed, Jul 15, 2026 at 08:08:00AM -0700, Bartosz Golaszewski wrote:
> > > On Wed, 15 Jul 2026 17:03:48 +0200, Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> said:

...

> > > > Cc: Bartosz Golaszewski <brgl@kernel.org>
> > > >
> > > > This patch is floating around for more than a year without anybody
> > > > taking it! Please, please, do something about this. Since it has
> > > > an ack by MIPS maintainer, Bart, can you just pick this up?
> > 
> > > Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> > 
> > Thanks, and sorry for the noise, I was cleaning an old branch and actually this
> > had been applied already. Sorry again, I need some vacation (which will happen
> > in a week).
> 
> d1d0aa620a0f MIPS: Alchemy: Remove unused forward declaration
> 
> I took it last merge window, or do I miss something ?

Yes, and that's why I am sorry!

-- 
With Best Regards,
Andy Shevchenko


