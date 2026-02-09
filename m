Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87F8B346770;
	Mon,  9 Feb 2026 11:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770638397; cv=none; b=HYNXVXsWD1BagmBWh5kXUXHqdoCQyJvrJo8XLlXdQB/mEJM3mt4C3K1hKRZT8B1CkHWecPQchSXky91kWHaXZ7MKVca8/zHYmdLsujvNhguh1/4Y7aAfDjfh85UMVeRNXtCKAa8S8CA+sf4L7KJSbYleHgBr/9KDc39fEXtPof8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770638397; c=relaxed/simple;
	bh=luI9Qc+/6IiB5aws+60a9k2dcPH41jMpwq6ZHScl9bg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gpkLjR11ryaCDXz7xECaD6QdrF58nuzPBJq02W0UDVU3Bunvd0MYx7tzCuTfBi8nJ0P8X15RnT1k1NnVI2USzdbKMwuQQvPqJYpS7F7p2v0Ml7z5s/VzlL8nH8rKborf20JWtqcYNmt+7U9nZDINroKu6logkcJwCBBQ1wXW3jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1vpPvg-0007A2-00; Mon, 09 Feb 2026 12:59:48 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id E9069C0907; Mon,  9 Feb 2026 12:59:36 +0100 (CET)
Date: Mon, 9 Feb 2026 12:59:36 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] MIPS: Implement ARCH_HAS_CC_CAN_LINK
Message-ID: <aYnMKFmB3Ve5-2OS@alpha.franken.de>
References: <20260109-cc-can-link-mips-v2-1-38123bfc5628@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260109-cc-can-link-mips-v2-1-38123bfc5628@linutronix.de>

On Fri, Jan 09, 2026 at 11:08:49AM +0100, Thomas Weiﬂschuh wrote:
> The generic CC_CAN_LINK detection does not handle different byte orders
> or ABIs. This may lead to userprogs which are not actually runnable on
> the target kernel.
> 
> Use architecture-specific logic supporting byte orders instead.
> 
> Modern 64-bit toolchains default to a n32 libc, which are not
> supported by all kernel configurations, as MIPS32_N32 is optional.
> On 64-bit, test for a n32 ABI libc first and fall back to o64 and
> o32 if necessary.
> 
> Link: https://lore.kernel.org/lkml/20260105100507-14db55e3-aa71-48bf-a6ac-33b186bd082f@linutronix.de/
> Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> ---
> Changes in v2:
> - Use -mabi= over -m32/-m64
> - Link to v1: https://lore.kernel.org/r/20251222-cc-can-link-mips-v1-1-6d87a8afe442@linutronix.de
> ---
>  arch/mips/Kconfig | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)

applied to mips-next
Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
