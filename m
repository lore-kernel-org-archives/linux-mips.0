Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A111A345EA2
	for <linux-mips@vger.kernel.org>; Wed,  2 Sep 2026 03:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788320579; cv=none; b=hizMEoST3aIAYN8yeXPAdvomZcGol9A4Z056da2pUd78T8D6ms+NiT5FomnlfQsrl0DVXIsFI0x2sJueE8xCkOmtugrzFnWUjpo35viX9e7rMC+ZsD7/JGxSyQuGIxXEVgyDh2HhlAVN2G/HKWZ0MeBcqo5yptkQ5l+ydq1+nPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788320579; c=relaxed/simple;
	bh=i3fo3pHteBDTj07Dr/Mi0B2AnpNZNlOf08y+DZE8ShQ=;
	h=Message-ID:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LuUOavf6gHWZy66jNAGXyO1d25VjAw+gWSzpCoT2C/FIwlaZ0D4IKmy6WiuSDzXZd0kJSj1jK+hcVDYZimY7uAuHRI5PYLUlVhoEGzLmfYXVpQ7/44uEHAsq2X0fD+VQCm41Ek/Il7h4P1htgVbRMF6n2BqUcC/VUjQ2i/etEzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gMCIUdT/; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gMCIUdT/"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2d9520b9155so4831575ad.3
        for <linux-mips@vger.kernel.org>; Tue, 01 Sep 2026 20:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788320578; x=1788925378; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g6mGPcki/1a/Lf2s2/1dI66mP0jWfESO0B2O9tUlL+Q=;
        b=gMCIUdT/uUXyjF71g2To4LLwdSHF8jlWguTo+Vp/qw/8+NkRZ7qyxc1UN0ZO3WgHZ/
         Z4kerIj9RTU++4QFGkV5uJpmrXAXsaTYpw+PtJZcOVYx4VZTfnkPTduQZgsHz7JVumv5
         Qsu4/TjpX0Knpi+gPOp1stH4j3Axcb/QZQ5B/UaRcLCYt7d4Dq+3UAFXcZJoMp1NzGZd
         xcbf9AOKxT5rIFqVpidTHmgS7WrOFAetHOFf7FqUREphbSJcOYCblYfbN69icDlmvAwX
         1MeXAHDARqg6wIJuq2eY6liBFDfCiLawcGS5YcONwi6YkD1Jt3UWn26qFXj2VV37Qtuq
         89CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788320578; x=1788925378;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g6mGPcki/1a/Lf2s2/1dI66mP0jWfESO0B2O9tUlL+Q=;
        b=rI6HnGeiFSgTgviPn4bQu6H1HZsyuSiAb+8zRkGhWHMTaP+SSuFsBplxBjczeGfJVR
         lkJma6LRuOhnt1tMmQX24fpWXBlmuXSqk2JjWYBfupthqwO0/ejZbV9i4jDlWbO/pe8V
         +FleYuDLPV0M/4wCgpmV409T/jRNfi+bF3iUXgZ4CjusXCstt/hatI7PzSiQW8u85aUN
         5t6xkt7fWiiQFEDcKzA5/BX2NUYKjticeGi6BD82YGIeyoOharkjktkfRN5XNuk99NFu
         ZVrtX7m2w/e4TQ+qY52jsIR1x79GWxcHyEbIWz86fNQCNZLepukK4Nj3mRqLI1M/4vqv
         1L6Q==
X-Forwarded-Encrypted: i=1; AKwUvBx7p1svUzMONLkGxpwhDpEGIcgnAqs3Z8MG8jp5+Vpb8Z4T3mTXXsMC4HzXVuYxvjrc8G2tJBon5+5o@vger.kernel.org
X-Gm-Message-State: AFuF++nY/4yRHG4k3SdOePHkZa7YNfjNcGITwrgoD7QAOpFDlqFF5Gj9
	8y0qSTlzJE9UQ8njwpXIQ3pG9vyRsBaurGzjdkH/vlzUCYXCxcCcgXjftNSG6Vo2
X-Gm-Gg: AYBFou1gdi14w91H1CfLZaSGGa54YadgXD3OCVZiCrMk+JitMrHuf+NFMpHD0YDk5WQ
	jcNl2Crd0St3ODl0GDN0Fr7SPoybkarnPwKI2lsMwplSo2sIe5NVJkvyQZeTy++0q/wreZL2Oux
	1Ejp0y3MlIOr4NtERXDdOGx/wwh4FLgEAp1HBQqoGZJqr9Js/DpF0GoiDQsgmOAuKOQ9A3gLVVF
	6nMyjMe5hSAPV07R1M76yJ09xVF+kCYG2/yhYIg5T2E9zxFCN8EwD+5oYf/qFPE2ekbSudVQVt3
	JtW9KvS0oA7+Hz/VPG6zrtAUhjJOioHeEMn7/pNYpduNusCIg2r2Kzr9A2Y/PYsKQY+UIxswFF0
	Aw5HuebCSsdIL58jXkuzhqoQvTnRaO0Ak6ucOfdcQB4JeGaRy0i6xhI9SCGvG5rS95cCkcj/M3D
	fwvTOiDEaBJZRYnMSKKUji0Ey878p4JZTXy32e7dG7yIedp/vcex70AxsT+NVQVKYZmmOJlwFf8
	hOE13SQ58if7NTCVafrfjuy9PyUtCMnw7XrtvEh2JVNF/Lfp9dDnw==
X-Received: by 2002:a17:902:e78b:b0:2d9:2fc9:570f with SMTP id d9443c01a7336-2daec738b38mr32120595ad.16.1788320577728;
        Tue, 01 Sep 2026 20:42:57 -0700 (PDT)
Received: from [127.0.1.1] (ec2-99-79-140-187.ca-central-1.compute.amazonaws.com. [99.79.140.187])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dadd4d7985sm5826315ad.84.2026.09.01.20.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 20:42:57 -0700 (PDT)
Message-ID: <6a979b41.d6e1292d.3d29a1.3309@mx.google.com>
Date: Tue, 01 Sep 2026 20:42:57 -0700 (PDT)
From: Zhijian Han <hanzhijian1991@gmail.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Tony Luck <tony.luck@intel.com>, linux-edac@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH] EDAC/octeon: fix kernel-doc comment for co_cache_error_event
In-Reply-To: <20260902012331.GEapd6k7g1DZxILLVW@fat_crate.local>
References: <20260821233751.2331272-1-hanzhijian1991@gmail.com>
 <20260902012331.GEapd6k7g1DZxILLVW@fat_crate.local>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, Sep 01, 2026 at 06:23:31PM -0700, Borislav Petkov wrote:
> I'm presuming your legal name is "Zhijian Han"?
> Because you should use your proper legal name when you sign off on patches.
> You don't have to send a new version - I can fix it up when applying.

Yes, "Zhijian Han" is correct.  Thank you for fixing it up.

Regards,
Zhijian
