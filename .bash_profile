HPSA_ID="a-mcleanma"
JUMPSERVER="dvc7402"
HPSA_MIA="spm5590"
HPSA_SPR="spm6590"
HPSA_MIA_NEW="spm5591"
HPSA_SPR_NEW="spm6591"

alias aws-accounts='grep Account ~/.aws/config | awk '\''{ print $5 " " $2 }'\'' | sed '\''s/\]//g'\'''
alias aws-bastions='egrep BASTION ~/.ssh/config | awk '\''{ print $2 " " $3 }'\'''
alias aws-get-profile='aws configure list'
alias aws-profile-sts='~/Scripts/aws-profile-sts'
alias aws-profiles='grep Account ~/.aws/config | awk '\''{ print $2 }'\'' | sed '\''s/\]//g'\'' | sort'
alias aws-profiles-sts='grep sts ~/.aws/config | awk '\''{ print $2 }'\'' | sed '\''s/\]//g'\'' | sort'
alias aws-sshkey='~/Scripts/aws-sshkey'	

alias hpsa='ssh $HPSA_MIA -p 2222 -l $HPSA_ID'
alias hpsa-dr='ssh $HPSA_SPR -p 2222 -l $HPSA_ID'
alias hpsa-new='ssh $HPSA_MIA_NEW -p 2222 -l $HPSA_ID'
alias hpsa-new-dr='ssh $HPSA_SPR_NEW -p 2222 -l $HPSA_ID'
alias jumpserver='ssh $JUMPSERVER'
alias ll='ls -l'
alias ls='ls -F --color=auto --show-control-chars'

aws-profile()
{
if [ ! -z $1 ]
then 
  export AWS_PROFILE=$1
  aws configure list 2>/dev/null
else
  if [ ! -z $AWS_PROFILE ]
  then
    aws configure list 2>/dev/null
  else
    echo "Profile Not Set"
  fi
fi
}

eval `ssh-agent -s`
