Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A5A3B636B
	for <linux-mips@vger.kernel.org>; Sun, 17 May 2026 18:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.238.66.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779042094; cv=none; b=uTs6aigL3ilHo1/+wWDXI43Lx0VeyglaHl5/xwxGK0y3iMvpn5zJ0NN3GKQzDPnJla4qraTHJ4TKppzIO7zx0ZFwaXvVVmHhM8lIYrVgYkj9r0OPX7jZr0TeBvkdRyJgNWZbE0b8gbWl0LV8jAqL2r8cDgJ/ILBwu+MNAotLTVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779042094; c=relaxed/simple;
	bh=aYiy+CizZIxxrptUcu5vzCWpcjNJ+w6KPfwb8hPhh4k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QHtLXyVeGRlDcJ36hJpD9+18+PltKRU8yKJJUADMjf7d5RwJ/ycpXiVKVycAs3mM5WmA53bVxPgBrZM5yD/NsC2bcrgaoAxU4OP/6LHhjKJZuZ38sVX4vxc0JjzSZcMAca7DIkBifHaVzRBbL4gH/SPchReGrq6wK8KtGn78iDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=openadk.org; spf=pass smtp.mailfrom=openadk.org; dkim=fail (0-bit key) header.d=openadk.org header.i=@openadk.org header.b=GLFlN+bn reason="key not found in DNS"; arc=none smtp.client-ip=89.238.66.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=openadk.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openadk.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=openadk.org header.i=@openadk.org header.b="GLFlN+bn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=openadk.org; s=2022;
	t=1779041609; bh=aYiy+CizZIxxrptUcu5vzCWpcjNJ+w6KPfwb8hPhh4k=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=GLFlN+bnOw0Zxe4qQB3OcNgSYwdQT1YiQvI6NPMNghCUdYyj7GrZ78fpM1LsfwS9x
	 2sjs4fRSHzyIDXL2qjTIsJy840sO3tcUspPGPPWdkU2LXOYGBVugvasZA5EU14nOkB
	 PW7iz/6X6IBnJl/DJvsJd/Y7DZo65tTr22fB9G0dPWvVWfXdkOF0qMG7VOnYNfiw27
	 h4vfiEU4kW4sFIIehzcLlzT1xspgtZqupIoEnJ11p10PQJBFvmOA4ru/XqHUGlGebt
	 sWAitmUAGfq9R4p5WeMd14cMXH5yRg4mHZZ77GPaco0K9UOFgBjczeBvDbw7VadRFq
	 udHV05P6B0icw==
Received: by helium.openadk.org (Postfix, from userid 1000)
	id BFBD731E0CA9; Sun, 17 May 2026 20:13:29 +0200 (CEST)
Date: Sun, 17 May 2026 20:13:29 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: Peter =?utf-8?Q?M=C3=BCnster?= <pm@a16n.net>
Cc: linux-mips@vger.kernel.org, Waldemar Brodkorb <wbx@openadk.org>
Subject: Re: Asus WL500g Premium (BCM47XX) problem
Message-ID: <agoFSZ8pdS_bt3C-@waldemar-brodkorb.de>
Reply-To: Waldemar Brodkorb <mail@waldemar-brodkorb.de>
Mail-Followup-To: Peter =?utf-8?Q?M=C3=BCnster?= <pm@a16n.net>,
	linux-mips@vger.kernel.org, Waldemar Brodkorb <wbx@openadk.org>
References: <aZ3NVrKLKgsflL1H@waldemar-brodkorb.de>
 <aZ-Ldi2U-51z3tF5@waldemar-brodkorb.de>
 <87y0hhgbip.fsf@a16n.net>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87y0hhgbip.fsf@a16n.net>
X-Operating-System: Linux 6.12.85+deb13-amd64 x86_64

Hi Peter,
Peter Münster wrote,

> On Thu, Feb 26 2026, Waldemar Brodkorb wrote:
> 
> > It seems this old patch is good to make the userland more stable.
> 
> Hi Waldemar,
> 
> Has it been integrated into the kernel, and if yes, in what version
> please?

It is not integrated. You can find the patch which applies on latest
6.18 kernel here:
https://www.freewrt.de/trac/browser/freewrt/target/linux/brcm-6.18/patches/0002-bcm47xx-fix-for-oops-in-copy_page-on-BCM3300-CPU.patch

best regards
 Waldemar
