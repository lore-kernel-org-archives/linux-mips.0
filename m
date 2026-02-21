Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E932DAFAC
	for <linux-mips@vger.kernel.org>; Sat, 21 Feb 2026 16:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.238.66.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771690156; cv=none; b=qKw9ov1lK/j6rqGlG8yeBAnwOX8SKRQaBOr/83PGdlRw4D1q3f5OHCrBDSBdgP9buuntsd9lDqr+e7NV42eXK/4mUwyblHZqGoIon6GUqK78JqjDshGJsdsJwQRaElRZGXNsOe06jslhTxI1Xqwca8HM6tj+bVahJWUUMx3JgBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771690156; c=relaxed/simple;
	bh=fZfl2MUHzgdnJXhvwhVpOkX/MpmtQWP6G4NGhRpazWw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FSKglbcCSxVb+9+n6uxIKoMun6FhdvRgu1vHFbCZppDboKAzFORSfjQi1mu7aIVzFLSL5lEFX8mj9QLXhIaunUjejPas/hi1bdY8dyPJfBP/RANA7UXuxePiL66CZkjQNfRluZG7Dp1rFm/Ku9K1bqFbyRBwMxhOQu3uJdzYZkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=openadk.org; spf=pass smtp.mailfrom=openadk.org; dkim=fail (0-bit key) header.d=openadk.org header.i=@openadk.org header.b=odeKuLnp reason="key not found in DNS"; arc=none smtp.client-ip=89.238.66.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=openadk.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openadk.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=openadk.org header.i=@openadk.org header.b="odeKuLnp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=openadk.org; s=2022;
	t=1771690128; bh=fZfl2MUHzgdnJXhvwhVpOkX/MpmtQWP6G4NGhRpazWw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=odeKuLnpURHvvEs7kqWLJCiK+Sy1mkFkVyiAbNKrfLs3+s25pqMuIh0t87859y919
	 sYYdMPBedwqPPXxiKcJoB3pqeFXrDBa5ofXndCGw/loe+LiqN5kYP9NUyFH9exiz7y
	 DUHcG//P2festXZpQECkGmE7fl74y7uaK5YxwqKJGvjUuyGxD6t59d+5iVLtI+JPG+
	 u84WeZ/ypxtTIZWlfFU1W3gbpkM1hwklLtxBIs1GDcxC6HRfB3H3YGYqr6mY0eBVDa
	 dS5IdMKalQdKQGgsKHvJSOb/ILYrM47bPHIn841zFPcKXGR7/dnrDWjCHsAozBwlbE
	 liNZdvc339Ctg==
Received: by helium.openadk.org (Postfix, from userid 1000)
	id 0ED1731E04E5; Sat, 21 Feb 2026 17:08:43 +0100 (CET)
Date: Sat, 21 Feb 2026 17:08:35 +0100
From: Waldemar Brodkorb <wbx@openadk.org>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Waldemar Brodkorb <wbx@openadk.org>,
	Rong Zhang <rongrong@oss.cipunited.com>,
	Jonas Gorski <jonas.gorski@gmail.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
	Rong Zhang <i@rong.moe>
Subject: Re: serial console on Mikrotik RB532 non-working
Message-ID: <aZnYg-1GZgwBbaqk@waldemar-brodkorb.de>
References: <1e9086c1-0cec-4aa7-aab6-e1e605dd9ebf@app.fastmail.com>
 <aYI9jVbCU-RI2gv2@waldemar-brodkorb.de>
 <CAOiHx=kU_kNSatruew1FQk2s=nmOanLB3tXjTi9tQ8je2mk2FQ@mail.gmail.com>
 <aYMrN3EhBM0Ip7b3@waldemar-brodkorb.de>
 <CAOiHx=nJN9suqTV7XfuTmO1X9QZv0wn=VqwkEzGmPctAF09v9Q@mail.gmail.com>
 <aYN1_mED5-IiKC4E@waldemar-brodkorb.de>
 <c80062a1b781ff256426d659ab327654174177d1.camel@oss.cipunited.com>
 <aYRG2p4PX-oELYhU@waldemar-brodkorb.de>
 <aZl5fBs9L5zV7fSD@waldemar-brodkorb.de>
 <alpine.DEB.2.21.2602211020130.3233@angie.orcam.me.uk>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2602211020130.3233@angie.orcam.me.uk>
X-Operating-System: Linux 6.12.63+deb13-amd64 x86_64

Hi Maciej,
Maciej W. Rozycki wrote,

> On Sat, 21 Feb 2026, Waldemar Brodkorb wrote:
> 
> > just for your information. This commit also breaks bootup of
> > Microchip PIC32MZ Graphics (DA) Starter Kit.
> 
>  I'm working on a fix, but it's a tough issue, because at kernel entry we 
> don't know the state of the TLB and the existence/activation of the hidden 
> TLB "entry disable" bit can't be determined (in which case we could just 
> proceed to the final initialisation).  I should have something in the next 
> week or so, but in the meanwhile please just revert the commits that 
> affect your particular configuration.

Great to hear that you are working on a fix.
Thanks for sharing your plan.

best regards
 Waldemar
