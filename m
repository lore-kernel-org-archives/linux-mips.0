Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C86735950
	for <linux-mips@vger.kernel.org>; Sat, 22 Aug 2026 00:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787358402; cv=none; b=rA4e83AzW8lGlLM+R2YfhrAiG7vg9gpXvXsuDbSuTWu7R8mRBM/mRrxtS26NbJwCVT7Agsda6bUVynUYrIqWJjNOvUK8ZmLkfrWKsKOSYmXrAryoyis3A6BHWPt3hbD+qb+Ml0ZahOyM+5u6ZWFphq4mfHF875JX4iDiZwX7agI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787358402; c=relaxed/simple;
	bh=4ok6BT9TfthL41cbOTgNb4+QpWb7iWkXBVAT8fNgs1o=;
	h=Message-ID:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZllhbGx69BeASfULYhsoMWFKdoT/iPPCgd6DRYaoi4FoY3WWl/iyNcUUzrenwdp6szHqSVZPz2UPljA6B4qF+gJYH4WGNfyN2LapASdxAPtUzilsGaSh9KEMGdcESqriteo46qMwAvfpMgmXu3TbHgclZL6lDD+vpk0Xcx6gfws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k8XTSNB9; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k8XTSNB9"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2ce98cb8165so16181235ad.1
        for <linux-mips@vger.kernel.org>; Fri, 21 Aug 2026 17:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787358401; x=1787963201; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4ok6BT9TfthL41cbOTgNb4+QpWb7iWkXBVAT8fNgs1o=;
        b=k8XTSNB94uQAeGBjtxVpIuImTXHH1aM++9hLNh1LnpT+gS19gPXrvB/s1+w+02PX5W
         iZJjUCMO1XMJCmUgz0jk0uq2lekSk6ps5k6VUyslysd80rId89Fr9X+/gv88/VEoBtri
         2dMR5eoX4FpHU78EfdHwzmxW3hFV9s0TasMh78Ytn/Adidi5Ac93BDkyvZhmZeY6PmaU
         7PJ4RMsfZK/s+4krDHOoqkZdTetZavBN1yFabWGxAAFFmAxflgpis+I4458a31Y73pEn
         wr2pkSNqNyovPqo9oHIxsEhRqmamr4OcHsyuZgL3Gz2IgVTff9uJ5WrdW3mivaKL90N1
         UNVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787358401; x=1787963201;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4ok6BT9TfthL41cbOTgNb4+QpWb7iWkXBVAT8fNgs1o=;
        b=qBpYIgQ1+ppllsRfoQl3KCxWzMMbPNl8HoS0G8mtZ3cRJTfj1K62x3H3Pbu0+MD7RU
         QpiAGhLhckDUyeCcBIMKICKKmBF2Ghpg/5Bp0z9we+A5BxlVERpCNUzijg5Wok7DPuZ4
         RN+oo1yEYbVLRZ9yJhg4Z5ABLblh2Wum8AZWXeXl769pzZgqO1gntL/plEGCIbTiOL2B
         nV/jgkSpthBvG94fJKmPTshidP408M7EhX1VugoGQwwPXJrLGoqmhUBhxvCHdO+56DSd
         +lDcEVn24J+yZBIOyHkqQ7F+srZaa4/9aRzlqbe8QhiWP8Z1ZeMQgE8puU7f41vaQLAV
         QObw==
X-Gm-Message-State: AFuF++kDaqHLQ+uiXjK1Lv064tJKwI0cB6UoK0H6+mpJx/yEWTRqYdqm
	f68O+GkxdCy00oTxY/TFmcAd2bnawitVeDw0QL9oUzLqNKOh+Q3Io9kMFeliaWB1YdI=
X-Gm-Gg: AR+sD11otF4wLIKQa1RByGXWu0n7si69wttHavmpozNnnfxhXAiXX3CByFKYFVjw46s
	UWakGWGZb2BxuGO9ihExJTY7afNAtQRXAbTCpZgI/tN1VQjp+v6GgLkG4BuNvktFrgklO5AjInp
	hH5r0XcVTwBs684TJZpQ7jFZWHx7GXHOa/tSOFxhVl/kadtBSV57357xhVtetJVnYGwAfb/MK9P
	03+u6SIjcHKnN53TtIkgx9biHw+anWJTIkpybB/nx0pNW9ZnDYlFjybb/He10MsEiUBupVqd1Hq
	PcPIeIglqwH6NDqV2GIX/dWTE8uivO26dJrv+gp8LiZXuN/DwU/S6bAQYsZXIgORDlIMopvcBXv
	1NznWsVJy43wrYzix1eHabGiaCplKgrhNOtSDTg14FRwyVTH9GKJuEuURIfxLUEO4m9nzKXruBu
	tAMrcS+O5KX8WSu1Vj3Hw4u5DYv32Rs39dLGmynRMud0dc+6Y1V12rqq6qqNxdiyPwHJmGLbiEP
	bX/vrn+2nTX2T0TObkDCEj+ulHC9PJnGLjHYCMKfdGnWL6vGNahLQ==
X-Received: by 2002:a17:903:388c:b0:2cc:db7a:251 with SMTP id d9443c01a7336-2d61a033188mr202422365ad.2.1787358400621;
        Fri, 21 Aug 2026 17:26:40 -0700 (PDT)
Received: from [127.0.1.1] (ec2-99-79-140-187.ca-central-1.compute.amazonaws.com. [99.79.140.187])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d676895a1asm320595ad.42.2026.08.21.17.26.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 17:26:40 -0700 (PDT)
Message-ID: <6a88ecc0.b25a1663.1e2de8.74a1@mx.google.com>
Date: Fri, 21 Aug 2026 17:26:40 -0700 (PDT)
From: hanzhijian <hanzhijian1991@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: OCTEON: pcie: fix kernel-doc comments
In-Reply-To: <20260822002256.2380061-1-hanzhijian@zepp.com>
References: <20260822002256.2380061-1-hanzhijian@zepp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Please disregard this patch. It was sent with an incorrect From
identity (a work address instead of my usual kernel contribution address).
I have resent the identical patch with the correct identity; see
<20260822002543.2381024-1-hanzhijian1991@gmail.com>.

Sorry for the noise.

Han
