Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793907669;
	b=wIis+g/VNtRj02Up2YYJ6x6nFPw3pTPBNOKzf0YY80QGKGr2d8ZnMfJ7sO43bR8pSHKq
	 210w2Erh2zeoXWBUZk9iTeTt8lEbr8PK12cQn1EM/np0/+/iwg0DoimSXtQr4KQfiXXqI
	 BmYyqmIQXGm2X4316U/62HxGC5IzB8MTRjBZVCI9A5bM9BZ1/jiyvdqmHD7mGDNHx5HQ/
	 hZW24cWpDdP+2FIZWgxASySIgiTRRUmobmMNxbpxzFnzVGCvShvfK5sRHPj//Vo3DtPsr
	 CpH+esyJdvZMtX2Bm0cUWA9UtiQiI/4gCf6HDVoG+lWPWRQ1zG+mG0oR+Xty5nBpqhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793907669;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=k8aFo/yc9X3s5VqY6RTuO7yq8GbRLky2z87jlIghXEc=;
	b=Oz1BPIGHIQ62JzryKak8j61JO1hVVjPHqIey1GW4RdXO9i3LZrbAUyCMKsseyx5WmUKL
	 bKTWa/tDu+tN0VOQd4890YEHw1Q+4olzW2I1gIOeOKSYTXe3lJjtyJX8jZjQA/vK3AKgD
	 KcF91e+nikXiSQ2ldaM4DSX17BVnlud94dYcGVAyjcjDSSGK7X5e9FSmw3y2iTsl077oF
	 UNGjqQ5OVU//mxmLsODn5RGhwFSJbppx1dx+prNECClcp1fttSbVjOqFAtU52Ec5TUAsl
	 dT2GcLm0EHAG1F6yr81hwYZF1tjnyZphUd3cJRgDb5bc/rfCvyzpc5e54jZN5CH/mIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ClZlBSae;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E4B46085220
	for <linux-mips@vger.kernel.org>; Thu,  5 Nov 2026 19:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ClZlBSae
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 948591F008A2;
	Thu,  5 Nov 2026 19:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793907669;
	bh=k8aFo/yc9X3s5VqY6RTuO7yq8GbRLky2z87jlIghXEc=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=ClZlBSaexqI7f4NkF3T1irH125scPMrpPmdrie2P+ladwbqmJax4Iy2LsLT0sb3RQ
	 Au1eiAHvDPV3FBuUSP2lzFq1O/jD767nT+QmO3EqfbzMuwrCBcatVDdrDhBfCKnfX/
	 ygXEDZlUw5f8PNZWwDBQJoSCDyMMyN0CbJ2sd4hXCNkQdtRqPuD6N+W7xp+5Lh9JBw
	 0YVB5q2Pn5PTh8tS/whjgOEwtvBISk0WcgmwZLWi3dDmEx/PLA7dYMfLUflxQ1aGnU
	 OgIgcCuk9BAJ4y2yiq4yigmbZ/uGRWLaAeKO0rKjRQn4X9XinYpidBsyh76viKDj9f
	 SvNuLWz1icZYA==
Received: from ams-compute-01.internal (ams-compute-01.internal [10.64.2.61])
	by mailfauth.ams.internal (Postfix) with ESMTP id C2745198003A;
	Thu,  5 Nov 2026 14:41:06 -0500 (EST)
Received: from ams-imap-19 ([10.64.2.39])
  by ams-compute-01.internal (MEProxy); Thu, 05 Nov 2026 14:41:06 -0500
X-ME-Sender: <xms:0dvsauiOSvqS6xJsAIJICJwgSJKeaLBodR1M7rlvwK6__yYgrhHiNQ>
    <xme:0dvsap0ckldRBwcDyKWWIszsgOqEE1Z59vGLOK4vkXsVL8tOwJ5jwoBwW6MDC4QQ8
    ox9Db8U2mVARXR22COiGAyZuVMRh3WsdVcn3aKjFYkxYuoJp-EAREw6>
X-ME-Proxy-Cause: dmFkZTEmnsfCORAF6cRR0aUe4yXm1XEW7kEU4v6TFdngIx1yejLSVwmdqRlVejDj5uzb0X
    yBQw0Kk9bumL3iU/eqgS3QXz2yeiQXdBFep3nBOxgFlrl5+fQjZD4yTQkg/7g1no3VbaEw
    iyQ4HJL9Kz5x05g84AKZ2GfYgmh3pTOSqWmia1I8r1ibLDk0/r6xocQ583hmG4fUTTxh/Q
    LOhQBg9tSghEqI+M7tffRSPXXeAKREeCR4g7WeJfsHXOfoG7PGIouulsd4jHHKdKE/stAi
    8cmVOoNZiL4pbdCQ/FfbGJi/srS5GgU4qBQWZKDXHiMvc2dMvnXAptyypm2p7XtdDELzpc
    Fx1WZj15AuvVeqQI2ArB8oIfyiLS81fUPAnv7isin8jCT6VrdP8dRcCxd/DIZsHCRhXZwV
    1x1hNKPJ9oSfcLHQb9+ITRc+gdSSQAGKXCfAQYCZjk4BBRnujJXbTjNb4y96mibuVUz6o7
    f6uxbgqnAEAmuw/IEnMHaHkeDLapy2RJD9BixIJ0C3JZ5yctqbVbT51iHL17C33brSSxmW
    ld/56supj6XtUVNnUWVGBN9YhTi00iEeniHIcjIEhBhjNv3GjuWyj+RyWweeVDdWnOOVWE
    FpfyrfV4Bbr435VvPmGkrNS/Hz+pKbygdtPbk47YZlhX2n67k9Hnawd0/Tdw
X-ME-Proxy: <xmx:0tvsaiGEHwHfPz4sT5RZiU8CLp0hlgMsqAHKpBnEr-Jg3KEBM3bIAg>
    <xmx:0tvsaqWou5ovRjbWqkURPElQrCHcjvCEpn1l1-0ZoR2xfry8F__8SQ>
    <xmx:0tvsahIacXdGdTFrvPkOqMgzLCykaZzoUmb7yYcPQxprHsj1-a7v5Q>
    <xmx:0tvsaq9TTPboPIdjNRjrhwdPRb5N0nHyzUw-ILPpEbo3l84bwSaxcw>
    <xmx:0tvsakIRRAbtJtyinkv114BEaFbjUgT23hHJ_0q47wKa0d9rE-G1Qh94>
Feedback-ID: ia3204a8f:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 6A67C2F8005C; Thu,  5 Nov 2026 14:41:05 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-ThreadId: AKtfczmvw_f7
Date: Thu, 05 Nov 2026 20:40:11 +0100
From: "Imre Kaloz" <kaloz@kernel.org>
To: "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Message-Id: <9c223475-8d9d-40ac-851f-c2d3eb210842@app.fastmail.com>
In-Reply-To: <auykJBSzKheGmuwv@alpha.franken.de>
References: <20261021192418.7246-1-kaloz@kernel.org>
 <20261021192418.7246-5-kaloz@kernel.org> <auykJBSzKheGmuwv@alpha.franken.de>
Subject: Re: [PATCH 4/4] MIPS: sgi-ip32: Fence PIO reads on CRIME 1.1
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Nov 5, 2026, at 16:43, Thomas Bogendoerfer wrote:
> On Wed, Oct 21, 2026 at 09:24:18PM +0200, Imre Kaloz wrote:
>> On CRIME 1.1, a MACE or PCI read within about 2us of a read of some PCI
>> registers (aic7880 HCNTRL, INTSTAT, ERROR) can return that read's data.
>
> this reads strange, can you clarify what is happening ?

When the CPU reads one of those aic7880 registers and issues another
uncached load right after it, the second load sometimes returns the
first one's data instead of its own: readb() of HCNTRL returns 0x02,
and the readb() that follows returns 0x02 as well. The second read
does not have to go to the same chip; the other aic7880 and MACE's
MAC_CTRL get the stale data too.

It only shows up with audio and SCSI DMA running, a few hundred times
in 25 million read pairs. A gap of 2us between the two loads cures it,
masking interrupts alone does not. CRIME 1.4 does not do it, and IRIX
also delays around each PCI PIO read on CRIME 1.1.

I'll reword that paragraph in a v2.


Thanks,
Imre
