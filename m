Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.175.24.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793893543;
	b=UqTcQaMgoeMLkGsJcycG/GlONDKwnuvA9H2toT0VDoyhv41s9ydEIYcYlCKGAboUur1v
	 +OhS90DpabV7yn5lW4L9CX49IuGx8z76YAwXLsSUCAMeG1aqoelttLkoRMNZqXnuxNjJS
	 JkXMzxCJoa+eCAud2TJP4mC+bVYx1jU/y4Wc+AgU+C0/3TJRq/1i6rCOkQLOv738DxMgw
	 1dM96DP9x1yst8zyqCxQ+O/kz0IgzDVQnpI3XRmYE2CgnoJcSyl+xhoayJ9P/Mp2mojDb
	 SfQTIC267H+Gfmcohx8m1VyoddBmCZnxdy0VT17ibrCU+bqDAuOEK+9qJ4T676FNeSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793893543;
	h=DMARC-Filter:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=9VukxRRuSXeYHmVPKXiTWo2+LgN3UQClK0OC8nzMeSA=;
	b=2yDvaDV9K1WtGKJwxIH6WBbHN55G1OCXswFUeCdaOnyjPPUDNMNG/2dYv+zSdzIisea7
	 Z2YTF94rvMtsOE/3UzA4l3I3qsFS/YPn0+bjsKDYHlA/CgD2QPr91+GNQlJZ08hUOk9ZN
	 KNpxWDeedoH03mQDCzwh1kIgTR6XTI6LUO192XLKxOs7mq8n593fnJQj0Lze4kPq1/coi
	 cuuhGjZr42p8e8dyiNcRDCcLcCx4Zxwp+nEehgNJPQ7KbG5jFIKH3Ifubo3w4RblykAl9
	 FOA9mXen/wFTMBeD4LRlCHDvK2Au96aXiV2n7xPw5bsmXi4CyYZRLinj+9v4USYts2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=alpha.franken.de;
	spf=pass smtp.mailfrom=alpha.franken.de;
	arc=none smtp.remote-ip=193.175.24.41
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B4A1606A31B;
	Thu,  5 Nov 2026 15:45:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B4A1606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1xOzeg-000718-00; Thu, 05 Nov 2026 16:45:34 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 6C9BCC043B; Thu,  5 Nov 2026 16:20:29 +0100 (CET)
Date: Thu, 5 Nov 2026 16:20:29 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: linux-mips@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
	Paul Burton <paulburton@kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] MIPS: Alchemy: Save the Ethernet address before
 reusing PROM memory
Message-ID: <auyevURhgo7dTuzH@alpha.franken.de>
References: <20261016221828.2223162-1-f.fainelli@gmail.com>
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
In-Reply-To: <20261016221828.2223162-1-f.fainelli@gmail.com>

On Fri, Oct 16, 2026 at 03:18:26PM -0700, Florian Fainelli wrote:
> Alchemy keeps pointers into the firmware environment and looks up ethaddr
> when initializing the Ethernet devices. By that point, memory allocation
> can have overwritten the environment, causing prom_getenv() to pass an
> invalid pointer to strchr() and panic during boot.
> 
> On the MTX-1, the struct page layout change in 9ddb3c14afba reduces struct
> page from 40 to 32 bytes and exposes this unreserved firmware memory.
> Bisection and boot tests confirmed that the parent boots while the change
> reproduces the panic.
> 
> Parse the Ethernet address during prom_init(), before registering RAM
> with memblock, and keep the six bytes in kernel-owned init data. Return
> the saved address during device initialization, preserving the existing
> YAMON formats and command-line fallback without reserving a fixed
> low-memory region.
> 
> Fixes: b93ddc4f9156 ("mips: Reserve memory for the kernel image resources")
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> ---
> Changes in v2:
> 
> - corrected Fixes tag to a more appropriate one
> 
>  arch/mips/alchemy/common/prom.c | 23 ++++++++++++++++++++---
>  1 file changed, 20 insertions(+), 3 deletions(-)

applied to mips-fixes

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
