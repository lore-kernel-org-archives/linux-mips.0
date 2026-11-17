Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.175.24.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794931407;
	b=TUIpf6uRGD3wjFw4kL/FAcATUK1frYguznhtxa4Hqocvs0f/gGWnDJGsnwYd7trlhr0A
	 zSyUi3gM8/X1Wq6L6Zzbp0RY6Ube3jpK9IJSydvKORBzM33CDOQ+4GinwxEItJ1FtCJRN
	 TAxBDAkW/Ii3A37WCnzVczjhywa8f609Pvhs+0wFoen5ohYcj2PqYbiE867aZ7odpTmiY
	 AKp4aozGN3Z3gWQrUM2yITlCOLVMG5BMXxH95/shiXNxNYACIIZSoWJLG/Xn0+gaR/rMp
	 oSNbCZpg3aj+Vy99xy81WHs4/NmdWwj4MzHJXOWxQK27JPxMBZDEjPwAeKdzE50QI/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794931407;
	h=DMARC-Filter:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Biz+e/06QfHcdz8mrRH7mtvPlxbbHnC5eUIhuO1cQKs=;
	b=1cZgAgON7n1TOhc0Tawhbv5RGGtJQxeAdlsznh2wIwlXnmnyQ1/Qkyla25XbQ5LlHDsn
	 NNi6H650PwOOJKIbsEMo1c33I2NvZ231TpBIAQT/PMeQznQSeivNLQqACpMQbpEYywIA9
	 z16vGdCqPZBxtAApspYXURHgYXTYlwnPni9tEo0/6K7laWqW8RJnTuQUQi5xxCv0Oq/mQ
	 wyJHXkCefgdPazDFe/3J5ih5GrfXpyBkcRZMxE0k+RVeW9/33xiMGH4lPQU386cy+i/41
	 80KDGgPcn149zOZFX4IRoLs/pFc1srdw9+JD4dly4bD66I9psM1HtqzZcJKlzfCF1AA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=alpha.franken.de;
	spf=pass smtp.mailfrom=alpha.franken.de;
	arc=none smtp.remote-ip=193.175.24.41
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08D96606A32A;
	Tue, 17 Nov 2026 16:03:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08D96606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1xTLeV-0004bJ-00; Tue, 17 Nov 2026 17:03:23 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 7A86BC01A0; Tue, 17 Nov 2026 17:03:09 +0100 (CET)
Date: Tue, 17 Nov 2026 17:03:09 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Zenghui Yu <zenghui.yu@linux.dev>
Cc: Thomas Gleixner <tglx@kernel.org>, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: drivers/irqchip/irq-idt3243x.c has never been compiled?
Message-ID: <avx6vWx2R807bzBs@alpha.franken.de>
References: <fd9dd97c-3aa6-4f97-9868-47e762c9ae0f@linux.dev>
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
In-Reply-To: <fd9dd97c-3aa6-4f97-9868-47e762c9ae0f@linux.dev>

On Tue, Nov 17, 2026 at 11:54:56PM +0800, Zenghui Yu wrote:
> Hi Thomas,
> 
> I noticed that irq-idt3243x.c seems to have never been compiled in mainline
> since it was merged in commit 529ea3681811 ("irqchip: Add support for IDT
> 79rc3243x interrupt controller", 2021-04-22).
> 
> Its kconfig symbol (IRQ_IDT3243X) is a bare bool with no prompt and no
> default, and nothing in-tree has ever selected it, so the symbol can never
> become y and the driver is never built by any configuration.
> 
> Is this a dead driver?

no, it's part of switching rb532 to device tree. The remaining patches
are sitting in one of my tree waiting to get polished and sent.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
