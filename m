Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8409917C203
	for <linux-mips@vger.kernel.org>; Sun,  9 Aug 2026 12:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.238.66.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786278804; cv=none; b=J1fcRtUdAyMVmD8+TXu+7iYYLMT3Tj5JOR8vEiZERmKK1vrd1eCbYmmIPNt4yn96H6Q47qUP8+/zU0YaR82T27ho/ZD25t+y5SrVz6YDrqoVYrL7yo2m7K1FDkeduNJqj2KcEElomvWxHrv8S3A8qvlZQbnkvsyiveGR3PNoZAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786278804; c=relaxed/simple;
	bh=PoQ9KFFxjLZtUEOS/RO3t+Ldzt/sly/VfXucBgUHbKI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JY92SPS/Ax8A3zS3VzkGAAVaDXAPyBrJHAD+Hio32ojepp+XJzNH15G4U+9Py6I6yuNDyjljG5RXoMueik8ZgZE8+8LiEqY9FVvU7W5cscNGy2tIgClBC+13WNYPuadiRHcxp2f4go1SWJTjXM9owPcqpzdlurdHJWl+guCjjiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=openadk.org; spf=pass smtp.mailfrom=openadk.org; dkim=fail (0-bit key) header.d=openadk.org header.i=@openadk.org header.b=iDntRLnQ reason="key not found in DNS"; arc=none smtp.client-ip=89.238.66.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=openadk.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openadk.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=openadk.org header.i=@openadk.org header.b="iDntRLnQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=openadk.org; s=2022;
	t=1786278801; bh=PoQ9KFFxjLZtUEOS/RO3t+Ldzt/sly/VfXucBgUHbKI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iDntRLnQyhmb1cGIW4qMlwJN8IA66cDRjCc1y7K3pZLr3zxP3/ra0maJBmkqVPxNj
	 tY5znzBbK5ruIlJZv8uBpJCVFyoicawhQ25uiM4EGIwjO+QwJ/RgVdM00VElS/uyV7
	 6CeVGnQ9Fk3JsolRhmpXhV3LYSKwtQj7vo2FNIYWR9si/cOn6fb2FZbqBCJY9VegLK
	 nJNRIUhQzYac1dja4EuNOHtd8dS51gA4ja5VnH/vLeYmNRv20/dMIber01peMYQmLS
	 TMfi4PXTwGjbtNaS9f4ryYJnCbQ04IUv0/gDAq3/Z8aXrS8nyb7C4NLpZTG/Cv/aE0
	 3lymVRn5pf+tQ==
Received: by helium.openadk.org (Postfix, from userid 1000)
	id 0915A31E0B0E; Sun, 09 Aug 2026 14:33:20 +0200 (CEST)
Date: Sun, 9 Aug 2026 14:33:20 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Waldemar Brodkorb <wbx@openadk.org>, linux-mips@vger.kernel.org
Subject: Re: imgtec ci20 HDMI broken
Message-ID: <anhzkCYSyOt-5F4v@waldemar-brodkorb.de>
Mail-Followup-To: "H. Nikolaus Schaller" <hns@goldelico.com>,
	Waldemar Brodkorb <wbx@openadk.org>, linux-mips@vger.kernel.org
References: <ancr4X9BNc3S0sC3@waldemar-brodkorb.de>
 <0DFD48CB-3CA5-46EC-9501-72C68A1F9157@goldelico.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0DFD48CB-3CA5-46EC-9501-72C68A1F9157@goldelico.com>
X-Operating-System: Linux 6.12.96+deb13-amd64 x86_64

Hi Nikolaus,
H. Nikolaus Schaller wrote,

> Hi Waldemar,
> 
> > Am 08.08.2026 um 15:15 schrieb Waldemar Brodkorb <wbx@openadk.org>:
> > 
> > Hi,
> > 
> > I recently played a little bit with ci20 devices.
> > It seems HDMI is broken in Linux 7.1.6.
> > 
> > Here is the kernel oops captured via serial console:

[ removed oops ]
 
> I am not sure if I did see the same error but I recently did a fix for bridge allocation (not submitted):
> 
> https://github.com/goldelico/letux-kernel/commit/9d039bd064094b176825da9f471e9c4447674703
> 
> Please let me know if it works. Then we can post it.

Yes it works! Please post it. Thank you.
I have seen your Linux fork Letux with audio support for CI20, are
you planning to bring this upstream, too?

best regards
 Waldemar
