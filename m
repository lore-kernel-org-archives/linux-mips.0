Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010AF49E5FF
	for <linux-mips@vger.kernel.org>; Fri, 11 Sep 2026 16:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789143208; cv=pass; b=s93AEKWg7VSQEcn6GPNZMQtoWZvCX86eW24RJ532zoEFeDZRlOW3d1qttxGqAWIE8BqLsCeZZfvO4dZcYG/0IjUBu+2M4Robh2I7auWH9OQPHJ97TFNxUBdf8iF+uaSBTrude68IZVHbGxYQjIqgXgZe9MVR2A1ctl13LmR8OiU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789143208; c=relaxed/simple;
	bh=o17OeanR+f8874fxRxAb9yjoao/cmBs3eLzTOvMjtJY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hU97g4WYxfhUkbk0//exo8kYK7gmUDX6JevVRqcsftpAqUVCDFGzhWaspf8EpppHw5CMiAqJ1ZhLmanhZA+kJd0kzX1rwgF0vEJ2ewOJ+r7MYWfUfuEy96E4PbeMSZWamdkE0sl0lAuzA8KgyIxxdPQjG7EVR38xlbjqvorM5g4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=anyfinetworks.com; spf=none smtp.mailfrom=anyfinetworks.com; dkim=pass (2048-bit key) header.d=anyfinetworks-com.20251104.gappssmtp.com header.i=@anyfinetworks-com.20251104.gappssmtp.com header.b=RouS9B6D; arc=pass smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=anyfinetworks.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=anyfinetworks.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=anyfinetworks-com.20251104.gappssmtp.com header.i=@anyfinetworks-com.20251104.gappssmtp.com header.b="RouS9B6D"
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-782af6c753cso1087909137.3
        for <linux-mips@vger.kernel.org>; Fri, 11 Sep 2026 09:13:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789143206; cv=none;
        d=google.com; s=arc-20260327;
        b=Mz65Cx04rrB23zkJTiE3Yrw6MWuqHyn3AzKS1PdY6sFRtS/RN+TolgRlfgf7Owkk7h
         CRquL8WOIXiGhJ678GnhAKqLhSOipRh4ktbFsBepryHHbiLcwClGMecLfI6StE042Z4Z
         lB4pglI6/egzApUgWzEtyRoCcG2MrkBYlEwduZOESvfYfL6YIdLUOtXpyoesYKzjiF/z
         CbUqOpMNpHd36iCBJJ72QEeRWp9IjJxJi4o1qc7ArqXS5Q3y1klw46eT9IX3vyIF+l/i
         AaTy1/ijRXksFPVn4eQRalG1UIN0H6ru8ln2+bDLQ0sRzlwxVea157juPr8stl/ERdaH
         Noyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=o17OeanR+f8874fxRxAb9yjoao/cmBs3eLzTOvMjtJY=;
        fh=7C1ieUBP0MH/N35b/CDBbnzpNRPSdDaqHS2IpXhX2bU=;
        b=DC0q3P0+BFePc8241auu9z5K8rwXsOj7oXd9A0p/K6xK8lVjoCuDoA1OXnZORQU8gr
         l8njDz0tnAetl2ZTEiQw/8gI8hAzHwZ4lr/diyzdyax+iN0Q6wH0kMXMM5atTldfFOeW
         TwPW+AExcZJH3tThrEWJb7l8QIlfJeWBL3OfEqW3ZV6EAfl1r7t7/T+3fdHZ+Ydynq9L
         3UnD82qOa2aB2C+TN6oLm4ef9vDbz8dmhtrIol/et6iGJLzlSK2msErX/FDCp7yv8I0O
         JjFKChS8oBstE0uA8tcgO8n5Q1d3uyI3uKR+TUlw7NFmYe9/VVTXIh2mvPwx2RStbTTn
         /hyw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=anyfinetworks-com.20251104.gappssmtp.com; s=20251104; t=1789143206; x=1789748006; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o17OeanR+f8874fxRxAb9yjoao/cmBs3eLzTOvMjtJY=;
        b=RouS9B6DFEUaKzfWu2e8eLfl3WhQoJmYHtf9Baul7Z5mnvxjKCyR7XdW65dc5AxDl6
         ivgb4GF0+J2Z8gxYbt/T+OaDZFYCsf9Zemw+lUanxgQhtJORECxSbnzNDMQMRDz2QmQu
         kKIrqJuJq6lzVhLhDVdZnqKfVen/lbn42JUx/jdcTsBbXy37xFtUeCqvnuyvYQz9urKf
         vT7lCDopn8BqAw7y4yEQLc65f8lY/yv0EubwDGZa4Mf81kzDuCNAQ/7Ib2s87N9Op4Gt
         2UIfrc07Z+oDqSldAlsM2eqhDNH5ngXhQIqL+cs5/CAbvu8Vzf0UR0bOA5rZcq/0Xc+g
         mtiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789143206; x=1789748006;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=o17OeanR+f8874fxRxAb9yjoao/cmBs3eLzTOvMjtJY=;
        b=PdW5uIwaI8wuYMXgWogq54zG84fFmRzUX5RjkM+UkdyYXagz+utBfTVlG99+gcBvPB
         qiI4BrFh1v/97Rzdk9iI4WoqvmJzHo1MOT5gbQJR4XVgJ4VEDuBfNbjjhjjdmFHjDdpo
         mgKdQlPfckTaoA4uVC9L9FiQKOSeLnXw3RSK5qRK1s4uDDtZVBwc2OsQ5+k/ZKj6zWOZ
         zKxxmM5hhQrrocShxfFBkhuwi5yD0gyo1GLUfNf0eF2GYjl5s8uG/LSgyTnD/uN50Euf
         PyrDrfUBihsuWqrbmRmL+cYPpjcn44fYbkjCPM9O8Y5lTKEtasivYQ2NBU8a0OG4Rw52
         9Zsw==
X-Forwarded-Encrypted: i=1; AKwUvBx86OlETUfOiUxogFS4SIhtQIhvVZPrxDD1G7XgYCp7VjNmPQURrwKVvTAdZ1yye09EG6Qa/dPVrlT9@vger.kernel.org
X-Gm-Message-State: AFuF++lbHaHAS0IX3GrhGaA/uesN+TWwwQqEJ/+z/RBlAfB8FUEO0dHw
	GREK/kmxlOE8jDZnzkyA6xmDmJ5QdsYn1QntaC8e7H5+fIe4ldCS4VoWHCnn6Z4BE+YusFSja8z
	JwET1xaFoUfIpwpiYzNL/Fr7I/JRuqFibAXa502KqVA==
X-Gm-Gg: AYBFou3/lCMF7K5i9UHgUrJBGZ2cEY5e+8rGUG+oKcf6F6SuzvZJyCsknoIzYlRw7c3
	qsvZIBLHfJ2CY3vXeIfvnkeJH11MjbuNQ034648jt6Pu/dBilOegwI+kEZzF3WtkO9ZBtOL4ufQ
	v0nlNN126J5INdindmN28N9oe0qSeCu0Dcr+R3UGh7vIyTM5e3j1IOKzYjsOWkugJmxe9VIe5o3
	W8dmvtlYfrurXyrab231JVlPR5LLjwvliJ+aHWXTc7h69o7NgHEYNH4hXLC2EzMtKkZrS/k7Z7z
	5aIxJ1EjP1ZnAL1KRSRwC4HQhA7GKIjg/FGIzZRAmlP2Y0tdUmsFyyc=
X-Received: by 2002:a05:6102:2906:b0:792:6eff:ef5d with SMTP id
 ada2fe7eead31-792a7720e44mr6095657137.2.1789143205847; Fri, 11 Sep 2026
 09:13:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904111731.673341-1-main.kalliope@gmail.com> <20260904111731.673341-3-main.kalliope@gmail.com>
In-Reply-To: <20260904111731.673341-3-main.kalliope@gmail.com>
From: Johan Almbladh <johan.almbladh@anyfinetworks.com>
Date: Fri, 11 Sep 2026 18:13:15 +0200
X-Gm-Features: AcwNN1VbHRZ6nj8HZW_zIRxsgv26adD5RCqJN375Skj_Q_o6IqWmWlOZFQd_XPE
Message-ID: <CAM1=_QTN3JJ6jtckf32F8wxBzLDbHSrzUttyMBWNqZKmRe=2rg@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 2/2] bpf, mips: Add support for BPF_MOVSX in
 the JITs
To: Nicholas Dudar <main.kalliope@gmail.com>
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, eddyz87@gmail.com, 
	memxor@gmail.com, paulburton@kernel.org, tsbogend@alpha.franken.de, 
	martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev, 
	jolsa@kernel.org, emil@etsalapatis.com, ihor.solodrai@linux.dev, 
	bpf@vger.kernel.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Nicholas,

Thank you for the updated patch set. It looks good, with one remark below.

> Use shift pairs rather than seb/seh so the lowering works on every CPU
> supported by these JITs. seb/seh would save one instruction on
> R2-or-newer CPUs but would require adding those opcodes to uasm.

I would suggest that we do this optimization. There are other examples
where the JIT can use fewer instructions on newer ISA revisions, for
example BPF_MUL (emitted as mul vs multu+mflo). You can add the
missing opcodes to your previous uasm patch. Then add ISA-specific
handling in the BPF_MOV emittors, in the same way as it is done in
BPF_MUL for example. When you have the full patch set, I can run
through test_bpf on all my QEMU mips targets.

Thanks,
Johan
