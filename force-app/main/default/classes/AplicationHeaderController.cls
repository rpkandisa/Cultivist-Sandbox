public class AplicationHeaderController {

    public boolean isMandarin{get;set;}
    public String mandarinText{get;set;}
    
    public AplicationHeaderController(){
        String mandarin = apexpages.currentpage().getparameters().get('mandarin');
        if(mandarin!=null&&!String.isBlank(mandarin)&&mandarin=='true'){
            isMandarin = true;
            mandarinText = '?mandarin=true';
        }else{
            isMandarin = false;
            mandarinText = '';
        }
    }
    
    public AplicationHeaderController(TermOfUSEController c){
        String mandarin = apexpages.currentpage().getparameters().get('mandarin');
        if(mandarin!=null&&!String.isBlank(mandarin)&&mandarin=='true'){
            isMandarin = true;
            mandarinText = '?mandarin=true';
        }else{
            isMandarin = false;
            mandarinText = '';
        }
    }
}