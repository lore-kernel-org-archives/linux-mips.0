Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B34C34DD3AA
	for <linux-mips@vger.kernel.org>; Thu, 17 Sep 2026 14:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789655989; cv=none; b=oJj6Ly2r3Q8/HsAV7BVlHT5aAkY2+Q7X5O8hcQ632xYR+BfbK97GxSGrB38fiZVUavPkzcnSOKRsrvS11WuryOj2tUd3MrEBsxELFvBaCQiIyHDUmBSWTjgs2apnqpGLZ8c0QaYwdGbii7GFMytNtxBsJrdwqwRtQzsmD1xIjGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789655989; c=relaxed/simple;
	bh=e1nEcm+47VRM3YuQ3OIfZ1Eloo/rMsg4M8gV3g0+0Jk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=qblbw0YFFTZlAhBJDWotXSIvduF+ht3xpTSlxSjIRMC0Rytd+qDBysrTgfjXu+X3WyqYUZ3dQAE5ZNu//1LBDAUB8cYLlhENdUDRFQQZyaqxq1h4dKjTsjkHu6kpC17DzhWZf+Suvj41tIgwH0cqNdKB5Qwx4UzkO6iLKUm6GEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IvpL4hVB; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=L7EpXpel; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IvpL4hVB";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="L7EpXpel"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789655980;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8KGR+CeC95ZWBixGwVA0LL51D5yK2uYqoswbmkSb/ZA=;
	b=IvpL4hVBvCynmqlsMqWFCw0Gz0lAbOGa29xeSfAPKw/B9DsipVi6D/RHJpdmJS2EjBh/NL
	WesU972Y7pnQI/j6fsQ4qS114Xst2tjSvHVJUr0gmhH02O1uEL/l7dgDNdnKSkcKANDCaP
	GOwCBCh3rm3Rj5CFQZtioGbI2ODeG0Q=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-503-QNWaoYL8NC-Jks5BTUmg9Q-1; Thu, 17 Sep 2026 10:39:39 -0400
X-MC-Unique: QNWaoYL8NC-Jks5BTUmg9Q-1
X-Mimecast-MFC-AGG-ID: QNWaoYL8NC-Jks5BTUmg9Q_1789655978
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-530f49fc5ffso29874841cf.2
        for <linux-mips@vger.kernel.org>; Thu, 17 Sep 2026 07:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789655978; x=1790260778; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8KGR+CeC95ZWBixGwVA0LL51D5yK2uYqoswbmkSb/ZA=;
        b=L7EpXpelvoFaFcpieOxOPxuFCsY2xb+zIBxMoT5r5JRIfrFMnOBf/PY9tKrET9yeGa
         efF6y45/UMC771RGAXoGt6lYE5P0hQGk5AYnoU0kMHlJHeRbK+Qj7VHGxAjlDFONjUdE
         klwGmMRWUCkyTh9sNaSWKpRemBawXaDxaHIm+WcNYtPQwwHP3F9NCNd9Zz0629lBy0bJ
         XQH07BsyLsL7XnfwRuSF/N+RK6N1uiQj5fW1cWahMZGom9dIKIvcG+j3CP5Cz8tjb93g
         D9A8wUVRgbxFATDi1pHRUsSFyWhB3BHW0sXouAdVHikgQhvaXesQweu2ml1AjiP76HOQ
         NFPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789655978; x=1790260778;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8KGR+CeC95ZWBixGwVA0LL51D5yK2uYqoswbmkSb/ZA=;
        b=tnL/t2sCfN79wXlrMfUxLy8gFjEUS3aiodrJ5sfcabXnOVfdq8+5cEkyEjJ019Il9L
         aiNaHRvAfsZpz+et+btQli2JhNAUD97wEjUp+IXOIEVPmgOwhlLXqTosHN7xmH8dLYrz
         KG29/WVEM/XmWHe/w6eXvSkrP/KUwxzf5lm/XTwrR3HR6/ilOnWeTwltwvQg9n/Fcmvh
         wCVKz1zHsKnqUnwReiizV9nHdgNpCjO9EHDQTChsxZ5WztzqYg/0HydT2ISKHIFQ2V/W
         yYhrg7ZmShrQXrldZSpT9v48nLARAvqkQVHVRr1ssAKBei9II4g7DCEmAF9dnoyko7S6
         2vzg==
X-Forwarded-Encrypted: i=1; AKwUvBxo/andZmwSqXQh4l1/4IdpqSFriA0PuIdoUh01VpVuDzQUrsPz4IxFKDGIgGNIFOtPsTLT1YqGSxE2@vger.kernel.org
X-Gm-Message-State: AFuF++krLrC7qusdh/c0juzUWqTu5uZwElxENuEuFxyTL2y0QnsoP2Go
	rQM0V4mR1mZUx7qh7kTRoUfEu9Q8qbcxFwO4yX8oiC6DzG9ytHkmvh95ymNjhWABNmsv48joqRY
	Lpe5RRgY/vwODY4kN55IdQwfbzzMxSQ4BUzFlxZRyd5PjEUr80oZCH1ehZ+Aphus=
X-Gm-Gg: AYBFou2R8LnD0SpTGo8fy5X+uPVNCrVmfLtcERVwz4nkgMU4kxKKTCOArSWxHT5XWc1
	qwHvH+RoBG45GwLTILa0oJt8tCG2RXZIVAFpglWWDQKS8bJ0w/jpdnOy+s3sXpRiT8d9IhWSsH8
	o9knzqpe8sHa0xVhK/wJM7isuwEKqgKAtbmgqca9ZXo3bnckT2MacEDj3nFrDiH95qG/IJptHOq
	YLtZ48v2yn5Ugxj0GlBLNaD1bw8iP3Mfa5GDT3sp6DfhsN0v7xfQNky5Ehf9Rry0hi1ngcqTFce
	EOcMa7NPSNzBdHONPa+rg0jXtepitJQNnFR6cfb66jW5DzuiZNabmWmk7uD4frz408FWDxiLh3h
	4dAa6l1MczChQuq45Vs0Qv/KdHKzLyiISgBIJGuc=
X-Received: by 2002:ac8:59c8:0:b0:530:42e4:f000 with SMTP id d75a77b69052e-5327f1e4523mr119767021cf.45.1789655978545;
        Thu, 17 Sep 2026 07:39:38 -0700 (PDT)
X-Received: by 2002:ac8:59c8:0:b0:530:42e4:f000 with SMTP id d75a77b69052e-5327f1e4523mr119766521cf.45.1789655977993;
        Thu, 17 Sep 2026 07:39:37 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5326204cc73sm49839641cf.19.2026.09.17.07.39.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 07:39:37 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, linux-mips@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260916-clk-eyeq-res-v3-0-93a3b831a5d0@bootlin.com>
References: <20260916-clk-eyeq-res-v3-0-93a3b831a5d0@bootlin.com>
Subject: Re: [PATCH v3 0/2] clk: eyeq: Reserve OLB memory regions
Message-Id: <178965594692.360090.15483787518804021390.b4-ty@b4>
Date: Thu, 17 Sep 2026 10:39:06 -0400
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=803; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=zv5XFnjC/JAkcy5rF9GDLkUufKHGuN1RVfY0nq2leS8=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLJW/14UH6wc3bVp49s2u/TMCfGTAqenbfuz+D3zkltPn
 kxvT+4+1lHKwiDGxSArpsiyJNeoICJ1le29O5osMHNYmUCGMHBxCsBEJnIx/K9YfvnHstef539N
 1L9QuiNcq73JWUHBPGOxzjfnsLKsl48Z/rtty7LL3VTpW1acLDj7cvTty5YWW+/f/WjHOfOSusn
 +FjYA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087


On Wed, 16 Sep 2026 14:08:53 +0200, Benoît Monin wrote:
> clk: eyeq: Reserve OLB memory regions
> 
> The Other Logic Blocks of Mobileye SoCs are clock providers, and some of
> them are registered early with CLK_OF_DECLARE_DRIVER(). Their early init
> maps the registers with of_iomap(), which does not request the memory
> region. On the platform device side, eqc_probe() used a plain ioremap()
> too, so none of the OLB regions were reserved in the iomem_resource
> tree.
> 
> [...]

Applied, thanks!

[1/2] clk: eyeq: Use devm_platform_ioremap_resource()
      commit: b8bd186778e74492a2bbeaed7e00d87dbe46b6f2
[2/2] clk: eyeq: Add mobileye,eyeq6h-central-olb compatible
      commit: 07bdb358bc50f17442b6b685d18a6f141b6f276b

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

