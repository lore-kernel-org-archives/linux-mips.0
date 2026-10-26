Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793047215;
	b=mJrVBa5BecnHhfnMvwhmoLWT+DrRFMuzbS2c0XvIkZ3NdCKgZLDW0C2M43ZKnOLQQV81
	 Uw41POzz+gGDy8o+rVm9l/nHwsZGpAGBMIBFr7BH849vcTgrGjCQTgat1UvJeD/xsXtyN
	 l+IMrBQ7sbEalvN5Zxmhvx30OBF1rqwQNoo2LHqEX3Kqcs/2jEd5mobNmXnnMGCquEGuh
	 Smgn1tlX7kzRVCYvKLqR3W6rj775fDQScvoGfSAUZTT18pvLO5xwSYDVDa/PExE1wtIxa
	 obklzHf4Uqh6tF8YUHkkyX/tJuQk2RmZXR2Ls9cJ6f8nqN0EdU8k3Wo4fpXCTybXxSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793047215;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=8BgiAGOUwi4MAq+usDyvckohLHEfK3Wwix9qVbEIIFE=;
	b=lqnb2rJ5fP/NXR3SpSpMG8XCm0YlCsdlyAj+FJgiGV9wvt0ydgTL/jUsEUdzil9ceJCc
	 A5bXSAlrxWDFFCnqBBdWsvqfcpYVVsiNnQ7VOFQ2xmvWuYGZff/vD6Bh9pIyPJJjbZwCs
	 ffpIuZKojUQdOT0Zo7cKCgRwIMlFq4MuGjz5R90Kwc9ojK0rXFzV8e7vy5K70vexspJq/
	 NzSZoJ/BJOMpd8L4qMEVC5WIabmgqio2wweG182QqXxKLg8vK+r30db4lbTi+3L4daK0n
	 5OcFhMnahAF9W+a2OWMi+yyi6Psfao1mVMGqSQSQpqbzftnw5BuIiJSDcc6D1CJFtmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QINZ7av4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F105606A31B
	for <linux-mips@vger.kernel.org>; Mon, 26 Oct 2026 20:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QINZ7av4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C88051F01825
	for <linux-mips@vger.kernel.org>; Mon, 26 Oct 2026 20:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793047215;
	bh=8BgiAGOUwi4MAq+usDyvckohLHEfK3Wwix9qVbEIIFE=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=QINZ7av4stTWQM9nIjT9Z1yCBcRiCzwj63MFF+45R/kHUgvXIN6iiRh1S8ZGzk9T6
	 R7QgdIfdYpIxPhGEyCWulfV72j6mzwds0ZA7f+wgWNTDDuOPNn8f/c8E3sAXk5pl/6
	 kZf8jNOAHUJYOpwQjNL+If3TsiCggzhHIjAindPvHnhqRmwpmTj7XC5cFxKQB93VXC
	 l2hWWzqHBKtCqfekyNIfwvOcGt81R8UBDNfCHwenx8ZSfYXzx73yTAzjEkjFAZjEDZ
	 z9uz8Zh7kP5LaS6F4ncHW7LP6LjdrmjN+lb7Pu3sP0c64OznYfauGOQMM3zSamjTxC
	 qOuLjTgve7oTA==
Received: from ams-compute-01.internal (ams-compute-01.internal [10.64.2.61])
	by mailfauth.ams.internal (Postfix) with ESMTP id 383981980047;
	Mon, 26 Oct 2026 16:40:13 -0400 (EDT)
Received: from ams-imap-19 ([10.64.2.39])
  by ams-compute-01.internal (MEProxy); Mon, 26 Oct 2026 16:40:13 -0400
X-ME-Sender: <xms:q7rfasY7M3-GFea8ByRSVr4bsSrXzimB8InuEDCEy53A4Wuet0uFyw>
    <xme:q7rfaiMrm9p0NyyDcAfSBN631U3YjeVPy1K99-gLor6DRZOFghMazgDX5TY1JLR6m
    g2_1aTlSGMGOhcb1eeYVX-shKK8AeEqzlLBvFmtw60uC_omuFK9oref>
X-ME-Proxy-Cause: dmFkZTFV0Orw4tg1xJQn/0UXTnHxurVk5H+ED3GXySdAiGs/PgiAlC4NN7ZmCVLXIlbC04
    ZEIA9yPFnTsivSmObgBFGdV8/puHt0g2BA+gFwg2zgC8LhNJjwW5g2jZWZaxogcqvbaY5q
    mRNiGMifOST46O6ExemHXigU9tvcS37UgTuWKptdBh6s0Lwb5jDAQD0/jAlIscFXlYl8lY
    roI4zJSWhwkFc1ruNjQ+azg092A3JcyIs2Sen5/a2C1WNRQ059p1SHtaEtwComMTkFZzyl
    7fvYfR+G/nsJgGfY7O/Ne4Wqlp4ybGetQ3cwBGSuvCq8y/cCCw18p3VF0S/5Pw+2g+vecu
    tOy8RGMMQZro8+zHI7lII5r2X98LecLz5RyDgBTOBfano2Hrdu+Ust/PhZb6/jWesJczNM
    dtQExevFYPOPrK6OLDPOgSUBoh+57chWmBEdKDtTthoyRa6QAnhMQuVahODzygKTZZhj2/
    WDht1yuFNTwO7JtcOzBIxwyFJZyn6N16eTLMWnCqU+Gmw8Gp1Fe12bxRIyvDZ6zwXKrUct
    DKzwkZoBOB6EtY682dMeCWzqq10fp6/b6i6ugWs237zT5HAg608N5G3rdY6Ldzbh6qcVJy
    RTeTMigB3Lqy8GUbaARgpk1u+3It/fo/9CrcQgmq3gDTttxHHaJ8dsnNeAnw
X-ME-Proxy: <xmx:rbrfaocPnNCiIfxtwKWoGu81PqOROW948fumRMxq6WVcAam5WkSvbw>
    <xmx:rbrfarsQe_Citl9W98k8-8hWHz2se-jTwJHhtCW6gGiOJH4d9Ya8uw>
    <xmx:rbrfapne58BBullySJXjGYyOli_efHZKDlDUoVKVgrFOeLQ4Ab1q-w>
    <xmx:rbrfatyWv1sGU8l3BLWGqmDaDJRCJyustJnh-o9j_xwwty0RIrYfNA>
    <xmx:rbrfarMrJmNggi0Xw7yNqmcC498uS9qvm9QUR5jdbVv2dJ3407n6cCw9>
Feedback-ID: ia3204a8f:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id BE19D2F8005A; Mon, 26 Oct 2026 16:40:11 -0400 (EDT)
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
X-ThreadId: A1EdMpTYANwc
Date: Mon, 26 Oct 2026 21:39:27 +0100
From: "Imre Kaloz" <kaloz@kernel.org>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Message-Id: <4dfca688-b091-40df-9158-003383338282@app.fastmail.com>
In-Reply-To: <alpine.DEB.2.21.2610262005340.42255@angie.orcam.me.uk>
References: <20261026120011.24675-1-kaloz@kernel.org>
 <alpine.DEB.2.21.2610262005340.42255@angie.orcam.me.uk>
Subject: Re: [PATCH v2] MIPS: SGI-IP27: Install the cache error vector on every CPU
Content-Type: text/plain
Content-Transfer-Encoding: 7bit



On Mon, Oct 26, 2026, at 21:15, Maciej W. Rozycki wrote:
> On Mon, 26 Oct 2026, Imre Kaloz wrote:
>
>> The R10000 drives an uncached attribute on the bus, decoded by the hub.
>> CKSEG1 uses attribute 0, UALIAS, whose low 128K is flipped by CPU slice
>> (UALIAS_FLIP_BIT), so slice 1 reads CKSEG1 0x100 from node memory
>> 0x10100. trap_init() writes the vector only through TO_UNCAC(),
>> attribute 3, unflipped. Copy it on each secondary.
>
>  OK, slice 1 gets 0xffffffffa0000100 virtual mapped to 0x10100 physical.
>
>  So does slice 0 get 0xffffffffa0000100 virtual mapped to 0x100 physical?  

Yes, only slice 1 is flipped. UALIAS is node-local, tho: slice 0 on node N
reads node N's 0x100 and slice 1 node N's 0x10100.

> How about other slices?  "Each secondary" suggests there are more than 2.

A hub has two slices, so the flip is the only difference within a node;
"each secondary" means every non-boot CPU across all nodes. trap_init()
writes node 0's 0x100, and per_hub_init() already copies node 0's low
0x200 bytes into every other node, so slice 0 is covered everywhere and
slice 1 on every node was not. Doing the copy on every secondary keeps
it simple; on a slice 0 CPU it rewrites what per_hub_init() put there.


Imre
