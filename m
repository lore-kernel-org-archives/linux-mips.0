Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B10E33D4F0
	for <linux-mips@vger.kernel.org>; Mon, 24 Aug 2026 15:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787584819; cv=none; b=MzOxQ4gXt86Axa8uJUAM0wcHBS9fA/xRj3981aaPgQJm/PnldtW7MKq4VN7mEmp2p59CypufFSFgJKaeFMJc6t7xfcYfNlDmaOjm/oEIEBUN3h7/+Dk2qJZN9XPRexiBMV1l7CsheOJWwUNgHXQ/nHNDLLbApj1nSddSA2NZFrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787584819; c=relaxed/simple;
	bh=fW26xNzRxiiLGaMaDgIpohlVSlfHRiHoa+AAfU3wNUI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rov1CcO4Cxxe60m5p7mFagYHwL1ZNnfga59ekVZZ8BQd6BQDGa3WN8cgOF/zIoO6oA8M/de3TLHzhx/EraJ2fzF8Dw949KZvckL0QYwtHg+GQom1WJXErjp6+KJAhmMP5KjHcJid7V3kwNZmsVzxmtHiZRKkLP2sKUmOOb74PyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WDVANHN7; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ja7W31df; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WDVANHN7";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ja7W31df"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787584817;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=i/thhCQwmqZWbgnvAoBPlN/ap50I780TmnPlwXGod7Y=;
	b=WDVANHN7HoctBHFTEq47W5CQ84Ziky9mAijKEJ/WHtBnKZabopQ5+OxZGkjkCmVRomfnW/
	3ENDZeTFUbaELQViK5rz12K2BvdPvEv7NQ3rUIr2pUCt4RshGl3TzikBtBisrADy3rgyWJ
	UIpJ5HPk/GjkPPnXmVJLntfhXGtQCXY=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-448-1Os9NLdbNyaAnhM2BDr_CQ-1; Mon, 24 Aug 2026 11:20:16 -0400
X-MC-Unique: 1Os9NLdbNyaAnhM2BDr_CQ-1
X-Mimecast-MFC-AGG-ID: 1Os9NLdbNyaAnhM2BDr_CQ_1787584815
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e62e3459fso364412285a.0
        for <linux-mips@vger.kernel.org>; Mon, 24 Aug 2026 08:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787584815; x=1788189615; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=i/thhCQwmqZWbgnvAoBPlN/ap50I780TmnPlwXGod7Y=;
        b=ja7W31dfEltW3udxdo/bTbGYJX4hlAsR7Bn2PEXhwzMcv+w8ty2Ry5bNjpV27KAltx
         izzFpNLMmoEmuwDINprRaFkUFgUMtivwUhlGn/3+J2xHVoQ2cESoEOLi8xONPWWCcDxL
         ZYiW1mNyvSv6l7rFNAPxiqEJBtU8d7rAg97yCrR9u2NyyIU/KjbrcPTAi7AxS2sB6K2b
         q5lfQ9vpMUeAhvcJjIazVqIAQp4HCtuh0KtZtvOWPX+EgP4Iw/n2AcJ95btPMTPE7YQ1
         tYEpdiskhlyAQxLe0bJ5YsANE8PG9DEq3TQOmrAKaanOPTRe9wHJHk0zmdTYeCw27dJr
         GUWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787584815; x=1788189615;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i/thhCQwmqZWbgnvAoBPlN/ap50I780TmnPlwXGod7Y=;
        b=qMdvOP1GO/5fa0nYqjoBX5LKtxd+vyWFvKcqns0vJT1sAD+mTtVTmowrOGIukFUTpt
         0evU/2Y1rDP00tswdegUkDZrQeApZ0znIGkod8FsqggZxI66JWyf8d/m+a/m+9QflU9V
         MI/0V+np4qEUgMzeL6cG7KvkbnfZscuRj/CG6GfAxK0gQsIOJaY7AafY1ZSme0wpFjaH
         CB8mGXGx7DewA+4QrynuvykNvst+mgHnGcHnQgvObUgrNtyX090/Owxhrq1rpc2/4PpR
         F0fOFZ6VNKS2kL3Q5ZxOeTrcHzDFfrGevNVfBmhb3VRe8dWpOr4LkugZkb4qYzdsy9lH
         pZyQ==
X-Forwarded-Encrypted: i=1; AHgh+RoA7e6+9bLcLW3++fOG4rxrtNp1VqTvV76//Re7Dv97un3BfPye44qBoDTZuXm+mg4Twytf5p+EpDUq@vger.kernel.org
X-Gm-Message-State: AFuF++m/06VO7OVD45bR3DLw35O4it4LeWxas1l25GKVL9vzV++2Dk5x
	yDxXky96lyhFGnU3jeyT5WzfZ/2Z9Paj5f8tdDdcHWr7D6eKSt9Ll2Nzf0xWb9xdlBaxiKDR7Pm
	GNXPtxOqKG65pY4B64UQXRWWjEqtwIMrqw/cin8znquFI5PnPZeYIojqkvivW3oU=
X-Gm-Gg: AR+sD132f5DHkQJkZUJducvT6Bl/Jsmlnlf4OK6vEoBlnrOyVUwRGy7utBpD1ilRjom
	CHFEXZPaFJznaLAxmh4Aji3T3UEsg8AXngqqjzlYNFbnvSWmsEEnkYhPIMLwcw/dBTjGQqUkdLc
	OJtxcPy+SWGljMPdFhAhJJPRsaX3LEtdMjWhLGdJ2ge/3YxovIi2HCel3sFmsZpXXPkAso6Ww97
	o6lSQ5XfNFsVbdde8Ls/LDEKOu11WsYRCkHWzXuQPgOS0URX3tqMDG1LsxBFasl4of/dpzcMj7j
	Ziy8EypUjeVL/PaJishZPKRWI/sZDeoySd6LPNJ7vvYVdC8fKqEoQgifHjgPe/UM5wLEiEntbtP
	lbRXYEF03D+BNsD7iMfloIHdthnomPIu0XGk=
X-Received: by 2002:a05:620a:28c1:b0:937:2443:341c with SMTP id af79cd13be357-937469ad942mr1885619485a.41.1787584815189;
        Mon, 24 Aug 2026 08:20:15 -0700 (PDT)
X-Received: by 2002:a05:620a:28c1:b0:937:2443:341c with SMTP id af79cd13be357-937469ad942mr1885610685a.41.1787584814629;
        Mon, 24 Aug 2026 08:20:14 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93749abe86esm519441585a.4.2026.08.24.08.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 08:20:14 -0700 (PDT)
Date: Mon, 24 Aug 2026 11:20:13 -0400
From: Brian Masney <bmasney@redhat.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH] MIPS: Alchemy: clock: Make sure clk_init_data is fully
 initialized
Message-ID: <aoxhLUxzlLBFyVG_@redhat.com>
References: <3610b51df642abb1fbb39f5bd93fddea43f8f164.1787240060.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3610b51df642abb1fbb39f5bd93fddea43f8f164.1787240060.git.geert+renesas@glider.be>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Fri, Aug 21, 2026 at 12:05:15PM +0200, Geert Uytterhoeven wrote:
> The clk_init_data structure contains several mutually-exclusive members
> for different methods to specify the possible parents of a clock,
> prompting drivers to initialize only the members they need.  However,
> not initializing all members may cause subtle issues, which are only
> exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> enabled.
> 
> Make sure all members are fully initialized, to avoid such bugs, and to
> prevent future breakage when converting drivers to a different method
> for specifying the parents.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Brian Masney <bmasney@redhat.com>

