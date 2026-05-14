Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81EED3793CE
	for <linux-mips@vger.kernel.org>; Thu, 14 May 2026 20:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778789730; cv=pass; b=u8oCC5Upkj4hhg8vnds9axLwzxkCvTL//3RLGJkuUpOjhkUDtTzBMBgWeSyBu9Hopax1JI6uLp7EvpPXggWja7gpD81R8x+FETfIgaF4/cCM3AlQJrIyLyJ/w9EfJEKn+0dEOC+AVFsvh76X/2MYNmsO6D/ruvCwocIS4g8qUNQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778789730; c=relaxed/simple;
	bh=L23g/GV6s5dbwKzNwqZYuRfdnx5W42pO/aIZUxIvmnc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hvPEzUs6n8Z1sBrfyPwbKEyukZMw/v+nX/BTnqb+KWmUNFUm60u9PjOQzSjaThVzgtk0Zkot9lQy1ajR6JoiV3BU2B0E+e0791TCgYkMzUHtxdq1klEbE49IOxvbNwBWEdfNuRtm3rWKmhUcHRKwYSJ6mOB7tXx1yEUxFDTrfVE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=f1PuyjQw; arc=pass smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="f1PuyjQw"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2adff872068so45531795ad.1
        for <linux-mips@vger.kernel.org>; Thu, 14 May 2026 13:15:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778789728; cv=none;
        d=google.com; s=arc-20240605;
        b=VqKrd39aQdCRS9iGcFqmamtA6oDjfgLAkAAPEPHGOrZRHLwhlKLHtlfdrPdGtE9Nj1
         tzTI6Ab7bmPECPJcQQiKQZT7di3H4MkCIW4h3NR3d6pUCqYd2f9qaXPNPsXguxOuQPlb
         52OMDZxwJXrJZHzajNtyxDR4yC8HSV9EdTF/hitsaD5RwXhHq+MEulNhdXJNS5hL8i//
         d2Nxf1aPpZUbh5NplohIKqoe703R1nffoJEUbGXJqq8ITi4MHc7+m+zn8xo9xhwM4XIV
         QBcxCeS0SLuN6Pq06/BX26ZroQdRfUJubLY97QFO5yTnoeX2p74LTg6fU/5pyf5+0pcv
         rzJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dSkJycESPksBK1TkswZjGhIZC6pa0KpxZLEtY/1MYi0=;
        fh=Yk8t/z0ZNwaokMKiRXqrlWJWxS+WRTaoSbjWo28DbHo=;
        b=lkGwuyZ9q65rkig9r2GCKyzpidDRVVgpYT00kFMqEXxCnDl3dt4jm4pufhLO10gQE6
         XYMYgbi4qkkxfscoaZP04oEaD7gEpm/0TRLE0viAE6tGYXKQzB8Q1tdo9Gwq4xLOo+hf
         A4bbzvBDPAATlEwVeQ8Mh7RSvkFmeczyw6OF8aQES+hC6q6sXEt0DPRqY187AtcNQqIW
         AyIkoQxiAuyXsbCx/Pg6xn1jEpqEcBT57JbauuNz4Rmu87vc6hsfKBQh76EGgLsSv9Ce
         BvDPINwpPAVcTPWHcZIAI8q1ZtsmAKchwSbv2d55/APIYplnbXgY/yyr9BCsQ6OTHYnE
         mw6A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1778789728; x=1779394528; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dSkJycESPksBK1TkswZjGhIZC6pa0KpxZLEtY/1MYi0=;
        b=f1PuyjQwJ2UPuKHYXu4AJK5jjx5qZA4xMN8oFmbMM5S8Ac7A8EiC4bFv8+yK3zvR58
         RprWQ6iZssF/m9KgvXeFW+e/fzXz+kFwBq0KrD4Gi9RSNABJXL/KRxqv69FLRbbZfium
         OtPKil4Kj04QLGDjz1ygQEO3t899yWsx+Qrt0cueifTj5DPn7bxlo2pF0kxZg9lR4ls6
         6bCpNlNg9E6Re+ogkUPfb7zhGQWImdudVZqXjBIyWFlx7ecR8ijcCmF8CKrT11IYwuEl
         fi3RvMyvB5buo0+DFYZV+OWp3hDZRXe8/92UMlTyLvVYMn4mdWrmlukj15scfYShu40H
         4oVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778789728; x=1779394528;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dSkJycESPksBK1TkswZjGhIZC6pa0KpxZLEtY/1MYi0=;
        b=PLeB8FG329pCjqJdkxImey1uYnwG1I4oeyR6C+4+f5IN1CooYBIUlcc/OalZa7lmgc
         J2MLQnVparLoqLATdMCt+Rh4+1nDoHHiORNx1rxTsKwwzo8tiBSsOkKpxJPzmPpoG4+/
         ntXWruOYRTVomsI7VSIwfHxwFzAlBxyqfHmcv2kaMKpr/5yGnfftfpnRRCdf1LNaMIqJ
         zAjMObw+3y4GshohaNEsXz731VkkXZMizPfRTfLxMZlh5/BRpCT0V+y0V/JLhb+27CeZ
         N45bnxnk/OCCG7ADrPfX/lgNpNxXLf2LXQbIMcsHwAnPXVjUXPG7tQARzflAMeYS+v+l
         PqEg==
X-Forwarded-Encrypted: i=1; AFNElJ8x0xkjJypPn/hu825MqYyGjpuxbDR4TX2VoElGIxVf8Hm6e4pkg5ovy39ayZKmkJVEcbZLG/Xdn3/v@vger.kernel.org
X-Gm-Message-State: AOJu0YwFdvvGU6RfGx5uPBgNUjOp0rPjmyS7AjZ9ZU75vqd22b7bQSXf
	hu9s3Fya4GOIMiU+FzMbTTcXbkWSDvvt084Q0n/nGi396C8esLgoZ+zmt3C/m/jeDw+LNOlvNjA
	QUfQVMsBe8wBEanOzxUi5LfatB1Ap7BfZ1hofe3BI
X-Gm-Gg: Acq92OFELkuvdgXurSg3+o9G/d2StKTL06KOLBPR/GcQU9qpit5OLzthaeW2PshnAz+
	vTinjvzdhvnWzYVJsTLx1iTV1HicBbBerJMIY1U84JdB7jO//L/rdz/Rzr8vwZfx6fdHGaCcE1B
	yzhbmLl9SC/skqcgLZd1d45F0kf7TQ9ziLaQDkCodGO7O9IsU+ZjY2Tmh8eoKX2W/noVMh9LY9F
	B0x/HSxVYpqzpH7bwH3ocrH9+YjPyc/+ZRKoV57Gfmp9yZTG54Oo1bV1+vtY1UsfYegHEVJqak8
	gtUsWFc=
X-Received: by 2002:a17:903:94e:b0:2b9:f59e:aca5 with SMTP id
 d9443c01a7336-2bd7e9e7777mr8938935ad.39.1778789727707; Thu, 14 May 2026
 13:15:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260509213803.968464-1-atomlin@atomlin.com> <20260509213803.968464-4-atomlin@atomlin.com>
 <CAHC9VhQthq7y2akbQSdJwBEex1MQYWG49wcJK3b8gSQuQ_d1cQ@mail.gmail.com> <bscbywzzx4nmxzbuw2bkzltb7rrmgmzy5u4gqy5pfpmafcnlto@eznniiguusqb>
In-Reply-To: <bscbywzzx4nmxzbuw2bkzltb7rrmgmzy5u4gqy5pfpmafcnlto@eznniiguusqb>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 14 May 2026 16:15:15 -0400
X-Gm-Features: AVHnY4J6HtYDS9Lrpjl43i8SgHkaXzBYbs_PTjoO3Mw_C9TveMyo-g1mcK1Gb3Q
Message-ID: <CAHC9VhSWrJc=aE1Sg4xfv1ZMmh=JqZFLWGeG2SnzOFqXxcUbtQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] security: Expand task_setscheduler LSM hook to
 include CPU affinity mask
To: Aaron Tomlin <atomlin@atomlin.com>
Cc: tsbogend@alpha.franken.de, jmorris@namei.org, serge@hallyn.com, 
	mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com, 
	vincent.guittot@linaro.org, stephen.smalley.work@gmail.com, 
	casey@schaufler-ca.com, longman@redhat.com, tj@kernel.org, hannes@cmpxchg.org, 
	mkoutny@suse.com, chenridong@huaweicloud.com, dietmar.eggemann@arm.com, 
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, 
	kprateek.nayak@amd.com, omosnace@redhat.com, kees@kernel.org, neelx@suse.com, 
	sean@ashe.io, chjohnst@gmail.com, steve@abita.co, mproche@gmail.com, 
	nick.lange@gmail.com, cgroups@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-security-module@vger.kernel.org, 
	selinux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 12, 2026 at 3:49=E2=80=AFPM Aaron Tomlin <atomlin@atomlin.com> =
wrote:
> On Mon, May 11, 2026 at 04:28:09PM -0400, Paul Moore wrote:
> [ ... ]
> > > Signed-off-by: Aaron Tomlin <atomlin@atomlin.com>
> > > ---
> > >  arch/mips/kernel/mips-mt-fpaff.c | 30 +++++++++++++++++-------------
> > >  fs/proc/base.c                   |  2 +-
> > >  include/linux/lsm_hook_defs.h    |  3 ++-
> > >  include/linux/security.h         | 11 +++++++----
> > >  kernel/cgroup/cpuset.c           |  4 ++--
> > >  kernel/sched/syscalls.c          |  4 ++--
> > >  security/commoncap.c             |  7 +++++--
> > >  security/security.c              | 11 ++++++-----
> > >  security/selinux/hooks.c         |  3 ++-
> > >  security/smack/smack_lsm.c       | 11 +++++++++--
> > >  10 files changed, 53 insertions(+), 33 deletions(-)
> >
> > I haven't looked too closely at this patch yet, but based on a quick
> > glance, can you help me understand why it is included with the other
> > two patches in one patchset?  The other two patches look like stable
> > level kernel bug fixes, while this patch introduces functionality to
> > an existing LSM hook; one of these is not like the others :)
> >
> > Unless there is something critical that I'm missing here, I would
> > suggest splitting this patch out from the other two bugfixes for
> > separate handling.  If there is a patch dependency issue you can
> > always mention that in the cover letter.
>
> Hi Paul,
>
> Thank you for taking the time to have a look.
>
> You raise a perfectly valid point.
>
> Please note, the cgroup-related BUG fix will be dropped from the next
> iteration of this series. As per Waiman Long (on Cc), a solution for the
> BUG was already proposed here [1].

That's good news.  I saw some discussion on that but didn't follow it
very closely.

> However, I suspect the MIPS-related patch will need to remain coupled wit=
h
> this feature patch. Because the first patch fundamentally alters the
> signature of the security_task_setscheduler() hook, the MIPS FPU affinity
> code must be updated concurrently to accommodate the new parameter.

I generally dislike when bug fixes depend on new functionality; it's
backwards in my opinion.  I would much rather see the MIPS bug fix
patch submitted as a standalone patch and then have the LSM hook
modification patch come separately, perhaps with a note that it
depends on the bug fix patch.

--=20
paul-moore.com
