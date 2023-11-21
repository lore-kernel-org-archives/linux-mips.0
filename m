Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JMt+CnEe"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5784D7B
	for <linux-mips@vger.kernel.org>; Tue, 21 Nov 2023 05:53:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700574810;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=FEF3J4hHQR8KNz6boDch4Xs+HDbHX5GimGPdHKJQsHU=;
	b=JMt+CnEegmhLFf2XGs2nOQbhLxgobnc+/9HCEoThIQwhqPPcnx9eP7/hpp1nznL0BSgL5y
	nDkIYYg52e5fEjsswQZyrMxXFbAdJzQi3XUXCKABx7MdjONYswdo98x+kEXzg4qNbXFWI9
	XYsQ2exDeTFvAGS1dyY64I3GhDD3EfA=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-472-GROXKNasOxW1bqYQhyGXtA-1; Tue,
 21 Nov 2023 08:53:27 -0500
X-MC-Unique: GROXKNasOxW1bqYQhyGXtA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3C9891C0756A;
	Tue, 21 Nov 2023 13:53:27 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.45.226.66])
	by smtp.corp.redhat.com (Postfix) with SMTP id 4B3511C060AE;
	Tue, 21 Nov 2023 13:53:26 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Tue, 21 Nov 2023 14:52:22 +0100 (CET)
Date: Tue, 21 Nov 2023 14:52:20 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org
Subject: mips: question about switch_to()->__sanitize_fcr31()
Message-ID: <20231121135220.GA952@redhat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7

Hello,

I know absolutely nothing about arch/mips, I can't even find the
definition of "current" or the caller of switch_to().

So, __sanitize_fcr31() is called by switch_to() and it does
force_fcr31_sig(fcr31, pc, next).

Was "current" already updated at this stage so that next == current?


Why I am asking. I want to add

	// otherwise the usage of ->siglock is not safe
	WARN_ON(!(t == current || task_is_traced(t)));

into force_sig_info_to_task() and simplify it a bit, but I don't
know if "t == current" is already true at the start of switch_to().


Thanks,

Oleg.

