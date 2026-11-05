Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.175.24.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793893543;
	b=3uQtJABbIjPZzY+9S3+Vhkh2Jl/+uYk4nx0AMd4PSojFdfJCsyaj8xKV9i/W1VoV680C
	 vwR20Lxykk5SxQQS0j1w42eJMxdvH4/QqWUWivCw59CS7dYtxEDZlckjwN6kwBWfMey2d
	 kP0iJezecEO7BZjLor1RShtDNyQc0K9eCxFg6lzZ/Aa0UDE2Cl2NDMTj93uP+A20GCHta
	 xMzpFdkvEIbBqBifkNwugTM9pMpPhMLpL51Cw4ymmhtwn8AZT1lJy3YSCnLwXxIuMEynr
	 Fp/k2dHMf1dBUrapjnmQG8YeHpiVpbG1fc4/ucyNVQjJKr7uUfB6ifl8C6lk16VHs1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793893543;
	h=DMARC-Filter:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=g21C3sy1bQZxJVsDcdsLz31GdcTKG8ycPzj6lFSJ+wI=;
	b=mTlC73MgN00PgOMEaTAxUzJouUyf6KvKacPQrFhCJdpubE66H70mTUCEnWUkaQRIi5wd
	 CnJU0iYZ0NFxCaIgumxR1d4GamqEhSJyNO6NRtuoVjfas54Igp80TF8KHjsgELg9bxIS6
	 mY4QDBK1ZsGe4DhntqF9N0kHsLl4JleT+F9KlfSD3Spx1JslGY5XPYSYPf6M1W1xsQjt1
	 6Fff2q5tKTevzjvTqCatZ4ATgHofCy7N2c8DZnM3w9Lj7rgiv7r8FpTch+WRvrYyIpA9C
	 FaGBSBWnN+kZF2M30QTTqeyWJZV+U5+V9HRWpCwed7H7iXlvDQCC7VQ/iO722qXOKFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=alpha.franken.de;
	spf=pass smtp.mailfrom=alpha.franken.de;
	arc=none smtp.remote-ip=193.175.24.41
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F714606A337;
	Thu,  5 Nov 2026 15:45:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F714606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1xOzeh-00071b-00; Thu, 05 Nov 2026 16:45:35 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 545DFC06DD; Thu,  5 Nov 2026 16:26:45 +0100 (CET)
Date: Thu, 5 Nov 2026 16:26:45 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Imre Kaloz <kaloz@kernel.org>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] MIPS: sgi-ip32: Report the real CRIME revision
Message-ID: <auygNcDhWoK7CRpF@alpha.franken.de>
References: <20261021192418.7246-1-kaloz@kernel.org>
 <20261021192418.7246-4-kaloz@kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261021192418.7246-4-kaloz@kernel.org>

On Wed, Oct 21, 2026 at 09:24:17PM +0200, Imre Kaloz wrote:
> CRIME_ID's low nibble reads 1 on both rev 1.1 and 1.4 chips, so it does
> not give the revision. ID 0xa has it in bits 63:32, and ID 0xb is rev
> 1.5. Decode it, and drop the unused CRIME_ID_REV.
> 
> Signed-off-by: Imre Kaloz <kaloz@kernel.org>
> ---
>  arch/mips/include/asm/ip32/crime.h |  2 +-
>  arch/mips/sgi-ip32/crime.c         | 26 +++++++++++++++++++++-----
>  2 files changed, 22 insertions(+), 6 deletions(-)

applied to mips-fixes

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
