Received: from fhigh-b6-smtp.messagingengine.com (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B186306757;
	Sun,  2 Aug 2026 17:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785692530; cv=none; b=eFgpEzGFF9MpmnjYo5z5b01RFEHt7s725vkh8Ka8RiAAuJzlN+pgc4L+5P5OYAkk85Gz/tsA6WPBHo061qjJtdZI7gNnVEB9hpiXZgP7pc58vrmXaUNWyEFR7ojAMmzcNJUsXH33gJP0j0pJqMVADDtUdPfhTHXeGb/HUnjg9iQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785692530; c=relaxed/simple;
	bh=uUKlLADzQZUG06xB4MNzy7xw4weMiwT4NF23izykAPY=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=AhBY3Vn2myyAe2upAGd+cLsNm4z/ujrhwIzR/F+LmJ6csleoJXZQHTn5eQr5hORa67dv23FLnttqbczgmsJ3dCds9uIuWRfbdFZLjKkZ+Bdn24+Us6HLaHrxNrEnCe/ahChCxNk0XhJvWofJ2aptTN8NKUpkIFi7onp59uXBUco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=ThV92Grk; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=VZ9/LVkK; arc=none smtp.client-ip=202.12.124.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="ThV92Grk";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="VZ9/LVkK"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id ED3677A00BE;
	Sun,  2 Aug 2026 13:42:06 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Sun, 02 Aug 2026 13:42:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1785692526;
	 x=1785778926; bh=WW66524WpYCZrF6Oxvm2fSTgm/FUxyIzW1EPOeia10A=; b=
	ThV92GrkuqLnLpvxtdBU8J5FARduSzszZJgW4eH9r1TvktZDXqrB5t/6QnYALkcI
	sCkFEDSuO/aQb7W7HkYepRF99pWMZs1XzTx3cxyLKCA3WdHgjoui+ZS6kh3rKFE2
	ijnBDVB3AKOebGF9uKSdzFCaWq8e3zBPmyQ/WbTTxRpDw2Qbufp5my4LbI01EqMM
	PPcCX4KUd3H1V2ZqKVTi8r17dVp47gnPGNhSfbJXDE73ZeTLYcOzQ3VY3PI8kkty
	VaJZJn6A3gu0arT7U1CeNY2TcupJ77XjcBfJdUCyNwsPobOogVTOJM3LA7GDcWAE
	GkTApg+Fna3XSIQ3kOrsvQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1785692526; x=
	1785778926; bh=WW66524WpYCZrF6Oxvm2fSTgm/FUxyIzW1EPOeia10A=; b=V
	Z9/LVkKRbSW0GlfsjZ5aYc3zlW3hxCRNPdlyhId7KBarudUyUmkssI98Jx4iFj4x
	KiLXhPZe6e89Y3az3yMkcq4VMEzKKnnct9QIrz+unONyK8h6PZlbbjTla7BF87uX
	exx7WOfi2EJfwjgG5DrMbVtgDKl5K/ePgyipGsb36ce4pSIsSMKZyzx8/vnBhgQv
	JVus1FfjGPOjCQb+mXfxMeKJG5/vSK363NUoHdbW2G3dxwL1vQgFOkUYhE91qE+m
	OlnEkLLVvdQgfQZ5vUototJWFRJVlEUMrc9bjIz1miogOu/WFiro2P6kGJrqfUJE
	roEeKvJVdMrCAz5DlchRQ==
X-ME-Sender: <xms:boFvavRdINpZhQ25ABxuReV5CbQHJ-XHBRWj8BnwbcUQztTIdq1nXA>
    <xme:boFvarkMsAQ5ihE1HUzc0VQOxUtlzCJyRD9nlu6_FWL27B6ovfMCjeuPfqs68K66s
    KIqULeTbJ085_zpxifI6KtuUca-U_27kOmhgbFzgnFzC33_27Q0P5OI>
X-ME-Proxy-Cause: dmFkZTFi/jh5zXlFeb+OSimMqST5K9Xe7eSQaDY6jbaprKk2mKlcuMMufpePP6K/iabRBB
    4/S5K9G9RrjT7zqQv8E3XmjQPxl8kzcgTDy5F3ZwDYRJoq24+AJoMeiHlOWSJWUaee+AFO
    GO4exG7ssxQZh4gX9ETpgM/bT9z/G9nd/97bWMWNMtwjUbQyWg4SybThzzoATkP+eBbDD1
    zkYy1mqkBeTodlidK9IiQB8g4Sd05WfwsC6kvYytGCHPGZrq9NL43zpqawwpo3+8wraUny
    MToL0hzGj7SeoEe057wsfJ7WUXmct0cHpHYeEYzexffNfHj7pfL5qmuLR4apraj90Elycg
    DGVNJPtI+gK3Q+3aXOFNx2OTWCsSQO6IQhEbSJ21ULtMETCPMDaEWXjlrVTyCJF2wu98Rl
    C00UmFm9V/IvTO97KXV4hF2Zo1jJVlaQVf5oUP35gcAI7FksKZkA3GODkSdm6fpjXWyDU2
    Kx8WRfKFd7y/W53CZOFnaTpUqA1HBOabPSjmSJT7G4Mw/CYqvYLOjsHvdIhyLWRM+aFkCs
    cxG3n115VNmQdkNSkSLjr13GNln2ChP17ENCgBwX2duGtJ7p0SSa9MHXQc4rf2quBNukWJ
    rxRUSoVd9sFQ70b9UTZxJPRjWNgjjQL+YKfE2b0CDPTbxFfPaxHv+H4NmPew
X-ME-Proxy: <xmx:boFvanGjS89FzVj9eMGhJztQw7u5Aqi0mtfnTdIu3LWYztbgXh4yJQ>
    <xmx:boFvaoBeqdk8i8XtTdXTYiAM0SC8Bvyd5J-DidbZfVULipS6mqsWlw>
    <xmx:boFvai-Xxz6B0W2GYoocXiaGfpSkYhZthRXh_oerVUYRp5fh5LZr4Q>
    <xmx:boFvasAIERKxGRC5e4z68NcyCHD-E5IUiZbexkzcpzf2-_kA2JTkdg>
    <xmx:boFvaid27VlgoqP_sT-T0pl_DBfJ10afjBDA9XHeDt6LjHPgxa3eyhov>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 24CEB182007E; Sun,  2 Aug 2026 13:42:06 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AMtqvN-ceN9w
Date: Sun, 02 Aug 2026 19:41:45 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Julian Braha" <julianbraha@gmail.com>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, cjd@cjdns.fr
Message-Id: <59c5582d-6fc1-48d0-a5df-b3b6f58aa227@app.fastmail.com>
In-Reply-To: <20260802161555.491549-1-julianbraha@gmail.com>
References: <20260802161555.491549-1-julianbraha@gmail.com>
Subject: Re: [PATCH] mips: econet: fix unmet dependencies for ECONET
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, Aug 2, 2026, at 18:15, Julian Braha wrote:
> ECONET selects EARLY_PRINTK_8250, SERIAL_OF_PLATFORM, and SERIAL_8250
> without ensuring their dependencies, EARLY_PRINTK and TTY are met. This
> causes unmet dependencies:
>
> WARNING: unmet direct dependencies detected for SERIAL_8250
>   Depends on [n]: TTY [=n] && HAS_IOMEM [=y] && !S390
>   Selected by [y]:
>   - ECONET [=y]
>
> WARNING: unmet direct dependencies detected for EARLY_PRINTK_8250
>   Depends on [n]: EARLY_PRINTK [=n] && USE_GENERIC_EARLY_PRINTK_8250 [=y]
>   Selected by [y]:
>   - ECONET [=y]
>
> WARNING: unmet direct dependencies detected for SERIAL_OF_PLATFORM
>   Depends on [n]: TTY [=n] && HAS_IOMEM [=y] && SERIAL_8250 [=y] && OF [=y]
>   Selected by [y]:
>   - ECONET [=y]
>
> Let's select the necessary dependencies, TTY and EARLY_PRINTK, as other
> similar architecture options do.
>
> These unmet dependencies were found by kconfirm, a static analysis tool for
> Kconfig.

I think this platform has too many 'select' that are not helpful here
and should be removed instead.

> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index a06f24317306..2423a6050088 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -397,8 +397,10 @@ config ECONET
>  	select BOOT_RAW
>  	select CPU_BIG_ENDIAN

CPU_BIG_ENDIAN is automatically set here because of the
missing SYS_SUPPORTS_LITTLE_ENDIAN

>  	select DEBUG_ZBOOT if DEBUG_KERNEL
> +	select EARLY_PRINTK
>  	select EARLY_PRINTK_8250

There is no need to force EARLY_PRINTK_8250, you should be
able to build an ECONET kernel without any console at all.

>  	select ECONET_EN751221_TIMER
> +	select TTY
>  	select SERIAL_8250
>  	select SERIAL_OF_PLATFORM

No need to select SERIAL_8250 or SERIAL_OF_PLATFORM either,
both can be turned on in the defconfig.

     Arnd
