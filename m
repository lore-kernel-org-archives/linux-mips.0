Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794402518;
	b=xz/DMB6F6wLi21d4uGA7sgwNq+ZVwAFexk62oxvMKWi/8HYvkUKAjPfmRc+DhERLlXoq
	 cuiypF75/keXpFKLPvSnt3csuzlbKFE2Z79k8QHp2ACkkB+EAi0q+FkreeKdjLoSMDGVO
	 NhriuV4br8MZmDGAkE6FiH+C6kDZh4WO5tUalvTyHO80ApKdCDusxEITcibjcaduiKb4F
	 g3KsXDYlklOUHNzDtVWYLYTb7Qupfaj+BeMHJyMAjQmk9cIYcAxwQ251/EX+6TGr+kPGW
	 Ah9hiC43GM8Qw302e6LjYS99k832uVDf+ha12Nw5iNiPoiBPBdBGhtWxkQnG3OdTayQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794402518;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=gSQbVcKPQJwETt5FSUoaPH66H/Mu8r7z5yZRwgw9qTM=;
	b=j9G87VkRO+O57z1qijSBZQR3z3MeHJP+V6r5D9IgO+il5GZxpOSJ1Ojn+ke0/HcBewcP
	 FWaxDSPo0vLDmr501OdTEwPNEFAzgh73gbYrGFznnh1KAN4Wzsax46o6nx2kqb2Az0OuO
	 iKjbuX/jNnImIe6BATIlVTm4d7C1UFW/zdQeyCJkZqSAv+mHBObdCIagTbtk0zdogwRDS
	 ymyWhPWyfoWJaSm7bO14kUUy4SMMwpSVYLWkmpfgSu+GG7QEDKtfhL8s9Q0dCrw7f38aE
	 7omzHzCAjBZQmUL3/iMBDpayuw806dTgErbKYJWvjUVaDVplobRqxgq8agqf97LkoNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CyP6U48N;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Fd8HMMvh;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2F9606A324
	for <linux-mips@vger.kernel.org>; Wed, 11 Nov 2026 13:08:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B2F9606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CyP6U48N;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Fd8HMMvh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794402516;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gSQbVcKPQJwETt5FSUoaPH66H/Mu8r7z5yZRwgw9qTM=;
	b=CyP6U48NEphKdWZGm0NGAYw4ZgL/9yEtOaxLjN2odfWfumXQ4FP9WLV6QTzYUbqIwvpLxq
	IFADfrcjZCtJTwY5j3w0NXwHC8D015mnBo6uD0pnf1b+BvuDX2DHCZRtDKqRV3l9/qQEw1
	AFvNtXKvkOk3UuVNcnz5BxivSmqiSEo=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-19-N4K_GN_eN4-Xp1dIpA4IOw-1; Wed, 11 Nov 2026 08:08:35 -0500
X-MC-Unique: N4K_GN_eN4-Xp1dIpA4IOw-1
X-Mimecast-MFC-AGG-ID: N4K_GN_eN4-Xp1dIpA4IOw_1794402515
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5358515b4easo56196081cf.0
        for <linux-mips@vger.kernel.org>; Wed, 11 Nov 2026 05:08:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794402514; x=1795007314; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=gSQbVcKPQJwETt5FSUoaPH66H/Mu8r7z5yZRwgw9qTM=;
        b=Fd8HMMvhZojoAzc43e5qYWj66PSuK9r8Vy2tyf9NK5ZuWxrImuxHbJKSWzgFyAtp1R
         pA41X1ghc1UBAofTN1mlnmpzWJzq0v1nppzBcj6+iY3Ubq4NF67RsqIL5nZxWdhsk2sV
         4Av1e/Tf8UHXqVCGyFITcYwERk8LXYXCnOK3Z2HPYefvqJ4LFgYomVBuFCYHublVWkFh
         ecp+NKWR/3P7I+9V/3D/jN6vdalEHDjZyAnDJ55RK5RhZNPspxVMgFQa0qZ+F3RRafqN
         s3jcGW1NDYs6r7TauTTu+Dl6dOjgjPwoIr2y4e0LW44TSBD9DSVwIAKOXfcDapZcmmX1
         /Rlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794402514; x=1795007314;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gSQbVcKPQJwETt5FSUoaPH66H/Mu8r7z5yZRwgw9qTM=;
        b=euc3+ocC6uIey3ETXhUYLBUOCnQSGJxtDmDU+tK0SaqWnfhLiL79zlGTCRKv5MTuhw
         9qHHEoBN9Z/mGu57vPMu4Ba+1cby9zVQ1KxJDhBTOyce+TozeUgnXbF37AgxWD/oe2mk
         qUQvsCstZzgZdYuDGOPHG2f7sDQVkLHWv/rzUoqC1RJ2bYA8M3BM6HqAxuJHiw3YH3mz
         z/M0uCoIb2Uh6SCPhAHW/rtffr17NFaXVWwXhKOU4/6BYYCO45xYg8LlQrxMfAfMYBxB
         YxSTAqc3jsC0Dz/foglK/zaTYxt/ixvfbD5Mt4ecAksCkGZ5lzVsRdyLXaUtidyjXhuC
         Y+Lw==
X-Forwarded-Encrypted: i=1; AL+hErEwEVvwv/yLfNib5ifRaAHhK7zA2w55qw0yWm0S8ibW6nb/FvWra1mdBcfmOJOfBFhQGoFOfIHvXrwb@vger.kernel.org
X-Gm-Message-State: APuU4Z+4Vs1ZGbt0am1JvyD8brXoifXmX1IJqzn7iAFnxMib4RpYTX92
	LMnDytB1ZVj2UA333XwqLtr7S2KdA313o4Yx4h8Zny75JvCwdkTqNhr+JfaDdtXTXyMFcAgct0M
	kRAj1Bc0t8wRdgjVNZDcN3xrYW4LE2IDZqsPoRiCrpQDlLgI2qyj2CePy6Ry+8Is=
X-Gm-Gg: AYBFou3tEwgiUPuwu0TFtt+9/U0em6S1jfvKuA4hUDVPDOL/pcDciNVOXrjekmFVq9T
	rxgHFpXXDL2l2/v2mIoOY250QUyAGS/uIC2yrRZbSqtOYQfZxgyxOroDCQyexfTDcfEMR6CvEjT
	da+L/u/v1UqwPUp8a2P+/3VEhNKXR5+z1HQ2fhyXcrAp9cIu6wfjUZsdZPf4z1sGcz8DpByhCGg
	qa7DNWpk8qhlKHg/8JEob59li1zDN+xOOj5mDXt5xL+yjHAs3m5/8DzdBTdaIddlW9p6CUVFZFI
	oWRCn6UPQiOOj2iBhiGgQhKKlsE3v/ScPxkkPdenfPb4k1nyZFoZ23f4pi3SMF2xwt33B+7qWhn
	3dFSUKZR0WQT4nyscfd3o9GmiXqklp52tC/pglWQsyZE8jj90GNRWCnkxZm3pzntgTU4uiOezZ4
	GGsgnwDaOu1mA0OXcBs4dpCtpkMCF+wISOxEwdlglk
X-Received: by 2002:a05:622a:1907:b0:536:2fd8:a4d8 with SMTP id d75a77b69052e-556bf740beamr31921811cf.15.1794402514456;
        Wed, 11 Nov 2026 05:08:34 -0800 (PST)
X-Received: by 2002:a05:622a:1907:b0:536:2fd8:a4d8 with SMTP id d75a77b69052e-556bf740beamr31921281cf.15.1794402514008;
        Wed, 11 Nov 2026 05:08:34 -0800 (PST)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5550af5f09fsm49902031cf.6.2026.11.11.05.08.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 05:08:33 -0800 (PST)
Date: Wed, 11 Nov 2026 08:08:32 -0500
From: Brian Masney <bmasney@redhat.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Paul Cercueil <paul@crapouillou.net>, Linus Walleij <linusw@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>, linux-mips@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] pinctrl: intel: convert to subsys_platform_driver()
Message-ID: <avRo0ItlTKTKyZ2f@redhat.com>
References: <20261106-pinctrl-subsys-v1-0-f17582f32aaf@redhat.com>
 <20261106-pinctrl-subsys-v1-2-f17582f32aaf@redhat.com>
 <avJKiYtczueslNSQ@ashevche-desk.local>
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
In-Reply-To: <avJKiYtczueslNSQ@ashevche-desk.local>
User-Agent: Mutt/2.4.3 (2026-10-09)

On Tue, Nov 10, 2026 at 12:34:49AM +0200, Andy Shevchenko wrote:
> On Fri, Nov 06, 2026 at 07:27:13PM -0500, Brian Masney wrote:
> > Reduce boilerplate code in these drivers and convert them over to use
> > the macro subsys_platform_driver().
> 
> Look at 20261104113343.1634218-1-peng.fan@oss.nxp.com.

OK thanks for the pointer. There's no need for a follow up from me then
since the series from Peng already covers everything here.

Brian

