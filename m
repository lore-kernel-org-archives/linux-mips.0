Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3346481AB1;
	Wed, 15 Jul 2026 15:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784128783; cv=none; b=jkrn2BLkY58u9ydckTrF3pYLZhuQyah29AujzcFVO7igYZG/VtU3I/fMhAVfPlMvLAEwvQwmtT4AXGmCi9/DhJsKm8ugOXoR5v/K9F3iQajivJFD8qhVL1QM+6OXwyFSv9WUWNq5cAYpNCEl5vlIu9YaUnOv39v7Ox9QWtqNO1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784128783; c=relaxed/simple;
	bh=53skGD9vmRqWM5lv40jxqEBSHGk28D2yhKvV8kumD7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZN8HYpNOoMWV2pAZ+fjAhOjX5zHFU37WmbL2bSskHnmlWP1OEt+85T5jvEaXl3U1wBaoD369cSbpA5iC2LV3wzRDLdIK+vG9K5yIww/IQgLQrKjD8zSdLyx14Vl9m74PVWjmRsX7RDIcjHe5rpcO3+t2EpZWkFrM5f917VGO21o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hcbT6hsX; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hcbT6hsX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784128782; x=1815664782;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=53skGD9vmRqWM5lv40jxqEBSHGk28D2yhKvV8kumD7Q=;
  b=hcbT6hsXFzcoR/u2RAlP1sRVob14qx6uPs9qS0gGMhoZ5uu26/GQSX6U
   sZMPGkuPicneA1+JxdK8tfLSbnXGEe06kDu3IUmtV7vu3TNqDzhFozGCZ
   KvtNlc9zULjp45WjI1Aikxy4G3mL/DNon9wtb/kR4kTGTKmxyeC5GqWA9
   CHS9jj36CKYZq2rEaRkKrdj1aZmE8PVch2wd59lo1Oz1ONUcul+ixX33N
   j6kdxUZb2ZYPjAzPEhgRZVDk32UM44Xb5r3qIvJ4TVHlM9C4jnkJwTZek
   AxrrQ3IXect6QaHMJzHYOqYnyWboniVtHRyUNQEKCCUsnMz7luZ47ZDQS
   A==;
X-CSE-ConnectionGUID: zSEx6n/lTjC8HWr8h5emzQ==
X-CSE-MsgGUID: q88JmRlARESXK4ZalXMkWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="102322710"
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; 
   d="scan'208";a="102322710"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 08:19:41 -0700
X-CSE-ConnectionGUID: xMpb33TaSQODxGJa6m+bDw==
X-CSE-MsgGUID: hEuxm2DITfio8J2jluiWFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; 
   d="scan'208";a="251798716"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.129])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 08:19:39 -0700
Date: Wed, 15 Jul 2026 18:19:37 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/1] MIPS: Alchemy: Remove unused forward declaration
Message-ID: <alelCeG0r8c8Mq94@ashevche-desk.local>
References: <20260715150551.1239925-1-andriy.shevchenko@linux.intel.com>
 <CAMRc=Mf_WVU__qRuv5zBpTcrZDewfVCUN0aXLOft5csv7OWRnw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=Mf_WVU__qRuv5zBpTcrZDewfVCUN0aXLOft5csv7OWRnw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Jul 15, 2026 at 08:08:00AM -0700, Bartosz Golaszewski wrote:
> On Wed, 15 Jul 2026 17:03:48 +0200, Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> said:

...

> > Cc: Bartosz Golaszewski <brgl@kernel.org>
> >
> > This patch is floating around for more than a year without anybody
> > taking it! Please, please, do something about this. Since it has
> > an ack by MIPS maintainer, Bart, can you just pick this up?

> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Thanks, and sorry for the noise, I was cleaning an old branch and actually this
had been applied already. Sorry again, I need some vacation (which will happen
in a week).

-- 
With Best Regards,
Andy Shevchenko


