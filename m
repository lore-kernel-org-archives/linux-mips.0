Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com [74.125.230.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 120284A5EB2
	for <linux-mips@vger.kernel.org>; Mon, 21 Sep 2026 14:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790002494; cv=none; b=aafdA36KId20E13w86j+HtkX7gI2SitbF8uAOYwWmPKFN/5w988/MBZowK9kvVXP8ew2BGUFquacJt/I2s0tIggKVwDGgQswDB0IegV2/1DMHTURxHf53kZY5WMevTlQsDPxRV5Y4c7KYxE2C//KPRisBdGaV3AenekZLxdtmFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790002494; c=relaxed/simple;
	bh=QWcJ1ZwZUHcxpyq7thHCmohE4ptDaGzodLSdKk9x9Zk=;
	h=Mime-Version:From:References:In-Reply-To:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DI54FminhfL7jtplz8fnEpAbK/e4rUywl+nqOPJRpqBAP+LuiclCVuoI3JgVVaw8pqQzwa1ZhcyeGsc027xFcmFzCmlZXNpvqzdz1mBI+Ir7yFU8cHM2KXOCE6vGpSETF3dmDm3kQ1J2ytRm2BEa8xVTOpnCSAouitudLMOTcGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=black-desk.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.230.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=black-desk.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a302c23fb2so25678871fa.2
        for <linux-mips@vger.kernel.org>; Mon, 21 Sep 2026 07:54:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790002489; x=1790607289;
        h=content-type:cc:to:subject:message-id:date:in-reply-to:references
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QWcJ1ZwZUHcxpyq7thHCmohE4ptDaGzodLSdKk9x9Zk=;
        b=VqcCQOuutR9U7KDETSTEJcGDQBP/N+GpFDUV19Pc0kFJGKPx0L35kwow6HMeaDFnTn
         CxmMNzsjZIGL8R/7L4vT5BXgD6CWRhnfu6ocmobCH33gVIF8OZZqOd7YRSXoW/7s3cV+
         RTH3OmAfeAYzZ+zEkaIrKP/5u4A1AtTDA3vbSjrBWwLMEmUcDA3UqMzBHFYtgtmzS45D
         UneAWHKFhkYEbGgNZD+NwudMZyhkQb7bttymNS2X5Y71noOQ1uUGKf1xsg29cHXZBRrc
         bUF0/k3Ls/F1W6vFHr2ViiR7RwbUcP+fWXaXAYsW0h/yyKqenfMDXrOlolZsg3cYVP0r
         EL/A==
X-Forwarded-Encrypted: i=1; AKwUvBxoLTzQUkbzAUOUTAzLeAJDTV2pMbdBoriZ2My5RiMXQb3u/xI0n1O2Q/MXzcikQEy0WNOcBec1l7EN@vger.kernel.org
X-Gm-Message-State: AFuF++nHNRjuRdvj4LVou9SRArmrUJskKrSIOyMFUNR51dZ76NH9FUmy
	tlubWgcMe1heTDPAgZuxDX3JxVEMSJnGpC0KiIh0Tg+eYGmNGiRsvruLJ5X9VTEmQNPMjQ==
X-Gm-Gg: AYBFou2DOelulx/xJWh0rs7/SJPfBBVtJ4wRtaHWeztfE/2n/aJDoQoGAITQjje5alE
	ThtVjVmdVTsZLNE9chS9aN+XVBpyXNJU92rqtvwbHLH/BZEVk1QKTntmpgMikYdJxMhQwq3nsVc
	i8r0SdbJokc3VEvNqdIXbocExtNHtlci00H4iJCtQBRsjEumc/u6cF9c/i1jl0+FOtAZ/DsgP9u
	Vvxj0zEN1B4QL4TpQ3UvQw/2rP/1h2PUOwU8vBAb+T2btsbDGa2Ph2w95Dsy24F0phW6Xa8sIoB
	b1gozgKLvhfdO96Z/Z0k/0s6WFIEqfEAqrPEXn0O7y3M28FlzxNEclWrLguwmmHz5fbUSwquopV
	LYpe77AgBsjAj9JYGj5FOhPs9in4SiyjGngtQEAXJEbqFqihSnKPRx1szxE5QDP7mxJFPLoyFWS
	gjv2uDz422Uh4NeENsxrTRClGoUEgbi2u/IbZVRyRSLx5IWPj2RTJExVnLkgMZAkIewACGhDMmn
	U20KyvdsHuMVqsaU2P8JuxJFkcpNWi+C7owmM0ILvGugGtMcD5P1/TFCax4vik9
X-Received: by 2002:a05:651c:a383:20b0:3a3:74b7:fc0d with SMTP id 38308e7fff4ca-3a5fc03661fmr16349111fa.25.1790002489199;
        Mon, 21 Sep 2026 07:54:49 -0700 (PDT)
Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com. [74.125.229.204])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a60765a963sm22365951fa.37.2026.09.21.07.54.48
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 07:54:48 -0700 (PDT)
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f1801fso3086342e87.2
        for <linux-mips@vger.kernel.org>; Mon, 21 Sep 2026 07:54:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzhNzrAnnCBypdSqJPJh45LdGJbcC09K0y/Oxip38gQ1F6PIJvUwCjEG2sxQs6vTHQG0+I+jC77JggV@vger.kernel.org
X-Received: by 2002:a05:6512:3a96:b0:5b8:9c46:d4cd with SMTP id
 2adb3069b0e04-5b8c1951288mr3688629e87.55.1790002488480; Mon, 21 Sep 2026
 07:54:48 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 21 Sep 2026 09:54:47 -0500
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 21 Sep 2026 09:54:47 -0500
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: Chen Linxuan <me@black-desk.cn>
X-Mailer: aerc 0.22.0
References: <alpine.DEB.2.21.2609191504030.27665@angie.orcam.me.uk> <alpine.DEB.2.21.2609191513020.27665@angie.orcam.me.uk>
In-Reply-To: <alpine.DEB.2.21.2609191513020.27665@angie.orcam.me.uk>
Date: Mon, 21 Sep 2026 09:54:47 -0500
X-Gmail-Original-Message-ID: <CAC1kPDOfcwWWf=c=P0jdkC3gY_XgW+kUVRHJUzGcbg3kDWXQVw@mail.gmail.com>
X-Gm-Features: AcwNN1V6c2qU0b0r9BU2071ZB6Xf7zCTCVbgql1xyH-Rm3j5rkXmiN9tXpwtK7I
Message-ID: <CAC1kPDOfcwWWf=c=P0jdkC3gY_XgW+kUVRHJUzGcbg3kDWXQVw@mail.gmail.com>
Subject: Re: [PATCH v3 1/7] MIPS: Only check -msym32 when need-compiler
To: "Maciej W. Rozycki" <macro@orcam.me.uk>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: WangYuli <wangyuli@aosc.io>, Chen Linxuan <chenlinxuan@uniontech.com>, 
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Reviewed-by: Chen Linxuan <me@black-desk.cn>
