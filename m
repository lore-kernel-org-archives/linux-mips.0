Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B8C3CAE81
	for <linux-mips@vger.kernel.org>; Thu, 11 Jun 2026 10:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781172693; cv=none; b=C/P0dJOzjjoWvYfgPRQv8Ncnoj22c819ODR/tTzZ9zXgn+eOWbhi1Im/57M4FdtIw+fW0Q7NxdVGDlcv7QzNLRmMriBNVcq7JmTSotBrT54m9qOvLmtOKmAax47MgUMX+wnZdtpEGxUJ4vXvWCfsRfQQD2af5BBgtwJJabv5k78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781172693; c=relaxed/simple;
	bh=jYECQqhOuGSVvKdTwPWyVL5AujdqMA5a0nxgPXJ1KXA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=e46cUz5HKmb6x7RfP/QoIyIeKRcKL/9k6V+QBpP55slt9IAQbJCeRnQsTjeS2Slq+yTym6q6ePeQDd5+vWkhv+NB+QXMd5kbChTyXHqMDSZv41AdjFrn3p8vguYH307LpZi5mk1Dmkj0l3RjsjpGkA/x1FhYx8eKNUNasBxJHY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HicNd6JZ; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=aUSRzXU9; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HicNd6JZ";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="aUSRzXU9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781172690;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8J03CxoywVvGkdqDT93IzLl+xZxTV2J8FpCDOD6Xyq8=;
	b=HicNd6JZir8vw4Eq455JYwYL+pMz2TlhhlTk83uOYYtOCT86RfNRcsjVRuXwQ8QClvWnHQ
	Jvi0FQKhz4eXrunUZHYXiPTZkEozSxM19l9e1DSH/FZT3j1+ncRdE56+dH76Yr+twKcKTC
	XdEg1kFj4b03KnEmhObJSTgcksC6DQ0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-212-IRVht2A0OjaDS9aZK2SDUA-1; Thu, 11 Jun 2026 06:11:28 -0400
X-MC-Unique: IRVht2A0OjaDS9aZK2SDUA-1
X-Mimecast-MFC-AGG-ID: IRVht2A0OjaDS9aZK2SDUA_1781172687
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-46010392f89so6987951f8f.2
        for <linux-mips@vger.kernel.org>; Thu, 11 Jun 2026 03:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1781172687; x=1781777487; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=8J03CxoywVvGkdqDT93IzLl+xZxTV2J8FpCDOD6Xyq8=;
        b=aUSRzXU9QGaPji1/m7+ubGAHyjvOG+cgcCuYdukcDW3oA/SA0WNQNZOwPoZbL+qVUh
         6pYQi7GBoOXMx1VbafPxYNybbDG1qfs+8envw+5udPKDaNq/DhwV/fXqa8lMRgkCKh2k
         f7oL9yGzd9Aafzg+wP5TGSDL+AbTmgaQP+MMEakWYHBkPyzhqwKvsUPOkWSTgHU66XhA
         rurCOFr6ZtC7i+/POAS795ZYG2t8Rz9ASJXkk5b/r9//qynvC4lIYUNM2wy3YixFQq8q
         ZVvV6ny4Wp19+8Htbmd0+LN2xrOfUN01SZpjfX8u/dqLOnY0gXaFG9MmqdKXOVyqHtIk
         FELw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781172687; x=1781777487;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8J03CxoywVvGkdqDT93IzLl+xZxTV2J8FpCDOD6Xyq8=;
        b=RJjjXcKyD+Qhw81/mt7cJ4HyZIJ17Hyqdwbj8o4nyT9D+Zyw0wxT5h7JtncNj+2iw4
         5VOhod2wY+MIhXFkpyoPxP+Jvs/LjFeiI58rqUV7fteDA5xD0U3U8yC6XjJ770IsiKk5
         Vhat2F5DhLiPElpyisBQZ/G7yhPzgeuSaCsGqQjt+peuqoSDWkNhl+I2Gye66jHg0Z7s
         vnRxz3GO70zgblTaF1UyjutqcFdaJvKhq+Fe7JO6y0du5yEmgplRtvHxtfwaBb3TIgvx
         7XeLjWZRzbkIdqrGaMAQ7PS0E1xfTmUI1wEaDUR1moWkf7RGKJyvFFoqhNoDMnNok+WY
         BfIw==
X-Forwarded-Encrypted: i=1; AFNElJ9fDPytTgMtgaDU4yND76vo9knm5yJQxxQx9OSp9tHyHJSs9pbNheDdlwAR+hX5uJp7CUzmWE/T+nRC@vger.kernel.org
X-Gm-Message-State: AOJu0YxHdkNzTmr5rYIo1NnRZTmjcPg6phBe1v8HlLaOD840m0YIfD2S
	7HSXW7bJ0USeW3tP6rB0hWNAMCN2XVxgSUUmMS9zrL7nauZPC3WBKbOZU9WOCYHEPHC2Hh5SgW9
	VsnfoA+OsCWVynwqh+QcD+Wq2NNglRCB+bm4VFWWixmSzWN6k+fOFXGa0NDq+HP0=
X-Gm-Gg: Acq92OGXurQn4Br3EnJapb3EPAgqkgkWqVaIrxgBaWtvieKvlwaIXX0zlCLJePIx/kg
	WEzJDZMunie8plTEgft507a5lCLTumi0RMEkikKFLRuBrMsDdtgqL+HKXbJOOBU2+oOlQNmje+m
	oGsZz8ForhckbLmmYE7w2Hn4A32kEt5I7lh76F4on8Qvin/69MpNeSpkrb0dXxDQ69qCVyZbCQc
	jIMuRmM+WYi9LkvD350blg45fB4cESiOSmQdgQJdrUVhaKMCY+JOpszuBFjp92vJFaFzOJfQ+K0
	wHBtGkWwXNuFdeH2pMKxPDm+9dohAIHHLjAo89fNdek1h/Pc2FmDc663DxWH9pxDwaffSfC5lpd
	vACCc2OApfMufhmqqkRE8uRUEVJQEOMwbWejG4ulvGWSWYxPKqeJOrOowIW4HGze66sC1RLr63N
	VCiPB9bww9AwN3CEE=
X-Received: by 2002:a5d:524f:0:b0:460:3233:bee8 with SMTP id ffacd0b85a97d-460677b28camr2150193f8f.40.1781172687245;
        Thu, 11 Jun 2026 03:11:27 -0700 (PDT)
X-Received: by 2002:a5d:524f:0:b0:460:3233:bee8 with SMTP id ffacd0b85a97d-460677b28camr2150129f8f.40.1781172686816;
        Thu, 11 Jun 2026 03:11:26 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2e4b18sm63288157f8f.10.2026.06.11.03.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 03:11:26 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, airlied@redhat.com, airlied@gmail.com,
 simona@ffwll.ch, admin@kodeit.net, gargaditya08@proton.me,
 paul@crapouillou.net, jani.nikula@linux.intel.com, mhklkml@zohomail.com,
 zack.rusin@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
 harry.wentland@amd.com, sunpeng.li@amd.com, siqueira@igalia.com,
 alexander.deucher@amd.com, rodrigo.vivi@intel.com,
 joonas.lahtinen@linux.intel.com, tursulin@ursulin.net,
 dmitry.osipenko@collabora.com, gurchetansingh@chromium.org,
 olvaffe@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-mips@vger.kernel.org, virtualization@lists.linux.dev,
 amd-gfx@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 stable@vger.kernel.org, Zack Rusin <zackr@vmware.com>
Subject: Re: [PATCH v5 02/15] drm/i915/display: Handle struct
 drm_plane_state.ignore_damage_clips
In-Reply-To: <20260610152505.260172-3-tzimmermann@suse.de>
References: <20260610152505.260172-1-tzimmermann@suse.de>
 <20260610152505.260172-3-tzimmermann@suse.de>
Date: Thu, 11 Jun 2026 12:11:25 +0200
Message-ID: <87v7bp5quq.fsf@ocarina.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Thomas Zimmermann <tzimmermann@suse.de> writes:

> The mode-setting pipeline can disabled damage clippings for a commit
> by setting ignore_damage_clips in struct drm_plane_state. The commit
> will then do a full display update. Commit 35ed38d58257 ("drm: Allow
> drivers to indicate the damage helpers to ignore damage clips") introduced
> ignore_damage_clips to selectively ignore damage clipping in certain
> framebuffer changes.
>
> The i915 driver does not modify the flag, but DRM's damage iterator
> will soon rely on it. Calling drm_atomic_helper_check_plane_damage()
> right before drm_atomic_helper_damage_merged() guarantees that it
> has the correct state. The i915 driver does not do this elsewhere
> so far.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: 35ed38d58257 ("drm: Allow drivers to indicate the damage helpers to ignore damage clips")

Same comment here than for patch #1. I don't think this is a fix.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

