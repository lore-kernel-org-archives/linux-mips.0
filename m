Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.62.254.231
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792498228;
	b=xW9ibVEFBtuOrU/d6IWFtXbLAo17iSSw9u1bDj7FmV9je3Nmuf+J9legDh8ZtOMnpf39
	 Vt9iqCUB6Y/gYMbTBn8VaDU5Uw72hWrb8QFeOKtXYc4/Sgd1mFD6z2gLU3mEDQS68WekI
	 7ZpOYLw6P5RZ+UtdKYu4gWMlglk5TeCyT4Nr1lTfWflhfq6UlTgOMamzJWvAvQzP/5was
	 q1383z23XIoZdS6vsvRs/UFZouMvw9FJ7q+3wisD7LxPbRFtJVJ9lpvDFVIMXsgwAVFU6
	 XgUS8Mh2IFIH28oZifXO6hhopr360GvmmplspNWeiS1Jos2qx+2l6Z5DmfPU07zKftA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792498228;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=sTpXpqxyTpYyZqI41kPo7NL0tb03kdS+CKkIuEPUMdk=;
	b=oNhs1J7xoK8098yXTb//RWZEw7z/EVNDxg0Bayouu8qKCNvX6w2DO0K/JZajqfaDyJAr
	 IkT32HNsNqkDK9TY5Y965Ow1ALnF3w6MhcqLBCmoNqCSJ1vyBPTxsp9ROb497B2T7tg6A
	 pxflyt8+8GP0+Citto0bRJTRnsjiw8zVe5U7c+pHKxVn8gm46ud9E1xCfR0GtcmkAMLKf
	 hB8L1EwqQm3gEwKeyf+eTT3Aby2UblurYLDRpjMdtCzv0rFJfAH70jaqRgXsuJ+y0m9Np
	 xlbMUkl7A62O7JjbcT7cZBzgqxV+nPScDiIM8JqgjPNPIYPTn2I2OWlkagERBrahRiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ilvokhin.com;
	spf=pass smtp.mailfrom=ilvokhin.com;
	dkim=pass header.d=ilvokhin.com header.i=@ilvokhin.com header.a=rsa-sha256 header.s=mail header.b=SgiIw18d;
	arc=none smtp.remote-ip=178.62.254.231
Received: from mail.ilvokhin.com (mail.ilvokhin.com [178.62.254.231])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD56606A31C;
	Tue, 20 Oct 2026 12:10:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DD56606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ilvokhin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ilvokhin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ilvokhin.com header.i=@ilvokhin.com header.a=rsa-sha256 header.s=mail header.b=SgiIw18d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ilvokhin.com;
	s=mail; t=1792498220;
	bh=sTpXpqxyTpYyZqI41kPo7NL0tb03kdS+CKkIuEPUMdk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SgiIw18dq/op+6gC0UqgBHtudL9pBSHF8UhNiPppS3zCUm2LOYtWIzk3JRo/IRsg5
	 WJbn+DJKfBDGk3J6UCMAuD8MCPhtPGCvRI3KlVMzsLd8AXfhx5/rSnLY6ilyD6H7B7
	 KQ6PwTPSkB8twGLwBJ62J/PmGkgbZbsOecZPy1M4=
Received: from shell.ilvokhin.com (shell.ilvokhin.com [138.68.190.75])
	(Authenticated sender: d@ilvokhin.com)
	by mail.ilvokhin.com (Postfix) with ESMTPSA id 0D214FB8D8;
	Tue, 20 Oct 2026 12:10:20 +0000 (UTC)
Date: Tue, 20 Oct 2026 12:10:18 +0000
From: Dmitry Ilvokhin <d@ilvokhin.com>
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: linux-mips@vger.kernel.org, manuel.lauss@gmail.com,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thierry Reding <treding@nvidia.com>,
	"Rafael J. Wysocki (Intel)" <rafael@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] MIPS: Alchemy: Register interrupt chips with the IRQ core
Message-ID: <atdaKuYVOlnpna2o@shell.ilvokhin.com>
References: <20261016181602.2152632-1-f.fainelli@gmail.com>
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
In-Reply-To: <20261016181602.2152632-1-f.fainelli@gmail.com>

On Fri, Oct 16, 2026 at 11:15:59AM -0700, Florian Fainelli wrote:
> Alchemy initializes its interrupt chips through the set-type callbacks,
> which use irq_set_chip_handler_name_locked() to assign the chip and flow
> handler. This bypasses irq_set_chip() and its descriptor registration.
> 
> Since /proc/interrupts switched to iterating the IRQ descriptor maple tree,
> the statically allocated Alchemy descriptors are no longer found. On an
> MTX-1, the file contains only the CPU header and ERR counter even though
> the timer, serial, Ethernet and PCI wireless interrupts work.
> 
> Register each IC0/IC1 interrupt chip through irq_set_chip() before setting
> the initial trigger type. Do the same for the Au1300 GPIC. Keep the locked
> set-type callbacks for later trigger changes.
> 
> Fixes: 171cc0d9eed1 ("genirq/proc: Speed up /proc/interrupts iteration")
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>

Reviewed-by: Dmitry Ilvokhin <d@ilvokhin.com>
